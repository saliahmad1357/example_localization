import 'dart:async';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  final _notificationStreamController = StreamController<String>.broadcast();
  Stream<String> get notificationStream => _notificationStreamController.stream;

  Future<void> init() async {
    if (_initialized) return;

    // 1. init timezones
    tz.initializeTimeZones();
    try {
      final String timeZoneName = await FlutterTimezone.getLocalTimezone();
      print("Local timezone found: $timeZoneName");
      tz.setLocalLocation(tz.getLocation(timeZoneName));
    } catch (e) {
      print("⚠️ Warning: Could not get local timezone, falling back to UTC: $e");
      tz.setLocalLocation(tz.getLocation('UTC'));
    }

    // 2. init plugin
    const androidIni = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosIni = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidIni, iOS: iosIni),
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          print("🔔 Notification tapped with payload: ${response.payload}");
          _instance._notificationStreamController.add(response.payload!);
        }
      },
    );

    // 3. Android exact alarm permission (Android 12+)
    if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _plugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      if (androidImplementation != null) {
        final bool? hasPermission =
            await androidImplementation.canScheduleExactNotifications();

        if (hasPermission != true) {
          print("⚠️ Exact alarm permission not granted. Requesting...");
          await androidImplementation.requestExactAlarmsPermission();
        } else {
          print("✅ Exact alarm permission granted.");
        }
      }
    }

    _initialized = true;
    print("✅ NotificationService initialized successfully.");
  }

  Future<bool> requestPermission() async {
    if (Platform.isAndroid) {
      if (await Permission.notification.isDenied ||
          await Permission.notification.isPermanentlyDenied) {
        final status = await Permission.notification.request();
        print("Notification permission status: $status");
        return status.isGranted;
      }
      return true;
    } else if (Platform.isIOS) {
      final status = await Permission.notification.request();
      print("Notification permission status: $status");
      return status.isGranted;
    }
    return true;
  }

  Future<void> showInstant({
    required int id,
    required String title,
    required String body,
    required String soundResourceName,
    String? payload,
  }) async {
    await init();

    print("🔔 Showing instant notification: ID=$id, Sound=$soundResourceName");

    final androidDetails = AndroidNotificationDetails(
      'instant_channel',
      'Instant Notifications',
      channelDescription: 'Immediate reminders',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound(soundResourceName),
    );

    final iosDetails =
        DarwinNotificationDetails(sound: '$soundResourceName.caf');

    final details =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    try {
      await _plugin.show(id, title, body, details, payload: payload);
    } catch (e) {
      print("❌ Error showing instant notification: $e");
    }
  }

  Future<void> schedule({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDateTime,
    required String soundResourceName,
    DateTimeComponents? repeatComponents,
    String? payload,
  }) async {
    await init();

    print("📅 Scheduling notification: ID=$id, Time=$scheduledDateTime, Sound=$soundResourceName, Repeat=$repeatComponents");

    final String channelId = "channel_v2_$soundResourceName";

    final androidDetails = AndroidNotificationDetails(
      channelId,
      'Task Notifications',
      channelDescription: 'Notifications with custom sounds',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound(soundResourceName),
      enableVibration: true,
      fullScreenIntent: true,
      category: AndroidNotificationCategory.reminder,
    );

    final iosDetails = DarwinNotificationDetails(
      sound: '$soundResourceName.caf',
      presentAlert: true,
      presentSound: true,
      presentBadge: true,
    );

    final details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    final tzTime = tz.TZDateTime(
      tz.local,
      scheduledDateTime.year,
      scheduledDateTime.month,
      scheduledDateTime.day,
      scheduledDateTime.hour,
      scheduledDateTime.minute,
      scheduledDateTime.second,
    );

    try {
      await _plugin.zonedSchedule(
        id,
        title,
        body,
        tzTime,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        matchDateTimeComponents: repeatComponents,
        payload: payload,
      );
      print("🚀 Notification $id scheduled successfully for $tzTime");
    } catch (e) {
      print("❌ CRITICAL ERROR: Failed to schedule notification $id: $e");
      if (e.toString().contains("exact_alarm")) {
        print("🔄 Retrying with inexact schedule mode...");
        await _plugin.zonedSchedule(
          id,
          title,
          body,
          tzTime,
          details,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.wallClockTime,
          matchDateTimeComponents: repeatComponents,
          payload: payload,
        );
      }
    }
  }

  Future<void> showTestNotification() async {
    await showInstant(
      id: 999,
      title: 'Goal Getter Test',
      body: 'Notifications are working! 🎉',
      soundResourceName: 'notification',
    );
  }

  Future<void> cancel(int id) => _plugin.cancel(id);
}
