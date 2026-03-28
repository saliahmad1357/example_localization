import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone_updated_gradle/flutter_native_timezone.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// NotificationService singleton: initialize once and schedule/show notifications.
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  bool get isInitialized => _initialized;

  Future<void> init() async {
    if (_initialized) return;

    // 1. init timezones
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));

    // 2. init plugin
    const androidIni = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosIni = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidIni, iOS: iosIni),
      // Optional: handle tap on notification
      // onDidReceiveNotificationResponse: (NotificationResponse response) {
      //   // handle navigation etc.
      // },
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
          print("Exact alarm permission not granted. Requesting...");
          await androidImplementation.requestExactAlarmsPermission();
        }
      }
    }

    _initialized = true;
  }

  /// Call at app start or before first schedule to ensure POST_NOTIFICATIONS is granted.
  Future<bool> requestPermission() async {
    if (Platform.isAndroid) {
      // Android 13+
      if (await Permission.notification.isDenied ||
          await Permission.notification.isPermanentlyDenied) {
        final status = await Permission.notification.request();
        return status.isGranted;
      }
      return true;
    } else if (Platform.isIOS) {
      final status = await Permission.notification.request();
      return status.isGranted;
    }
    return true;
  }

  Future<void> showInstant({
    required int id,
    required String title,
    required String body,
    required String soundResourceName,
  }) async {
    await init();

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

    await _plugin.show(id, title, body, details);
  }

  Future<void> schedule({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDateTime,
    required String soundResourceName,
    DateTimeComponents? repeatComponents,
  }) async {
    await init();

    // Make sure scheduledDateTime is in the future
    final now = DateTime.now();
    if (scheduledDateTime.isBefore(now)) {
      print("⚠️ scheduledDateTime is in the past, adjusting +1 minute.");
      scheduledDateTime = now.add(const Duration(minutes: 1));
    }

    // Unique channel per sound type
    final String channelId = "channel_v1_$soundResourceName";

    final androidDetails = AndroidNotificationDetails(
      channelId,
      'Task Notifications',
      channelDescription: 'Notifications with $soundResourceName',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound(soundResourceName),
      // If you want full-screen alarm-like behavior on Android, add:
      // fullScreenIntent: true,
      // category: AndroidNotificationCategory.alarm,
    );

    final iosDetails = DarwinNotificationDetails(
      sound: '$soundResourceName.caf',
      presentAlert: true,
      presentSound: true,
      presentBadge: true,
    );

    final details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    final tzTime = tz.TZDateTime.from(scheduledDateTime, tz.local);

    await _plugin.zonedSchedule(
      id,
      title,
      body,
      tzTime,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: repeatComponents,
      androidAllowWhileIdle: true, // ignore: deprecated_member_use
    );
  }

  Future<void> showTestNotification() async {
    await init();

    const androidDetails = AndroidNotificationDetails(
      'task_channel',
      'Task Notifications',
      channelDescription: 'Task reminders',
      importance: Importance.max,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _plugin.show(
      1,
      'Task Reminder',
      'This is a test notification',
      details,
    );
  }

  Future<void> cancel(int id) => _plugin.cancel(id);
  Future<void> cancelAll() => _plugin.cancelAll();
}
