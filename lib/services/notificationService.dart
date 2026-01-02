import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
  bool get isInitialized => _initialized; // ✅ add this getter

  Future<void> init() async {
    if (_initialized) return;

    tz.initializeTimeZones();

    const androidIni = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosIni = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidIni, iOS: iosIni),
    );

    if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _plugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      if (androidImplementation != null) {
// Note: This only checks if the user has granted the permission.
// It does not handle the initial app-level POST_NOTIFICATIONS permission.
        final bool? hasPermission =
            await androidImplementation.canScheduleExactNotifications();

        if (hasPermission != true) {
// IMPORTANT: The requestPermission() method will attempt to open the
// device's settings page for your app, where the user can grant the permission.
// You should inform the user before calling this.
          print("Exact alarm permission not granted. Requesting...");
          await androidImplementation.requestExactAlarmsPermission();
        }
      }
    }
    _initialized = true;
  }

  Future<void> showInstant({
    required int id,
    required String title,
    required String body,
    required String soundResourceName,
  }) async {
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
  required String soundResourceName, // This will be 'daily_sound', etc.
  DateTimeComponents? repeatComponents,
}) async {
  
  // Create a unique channel for each sound type to avoid "sound locking"
  final String channelId = "channel_v1_$soundResourceName"; 

  final androidDetails = AndroidNotificationDetails(
    channelId,
    'Task Notifications',
    channelDescription: 'Notifications with $soundResourceName',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    // Note: Do NOT include .mp3 extension here
    sound: RawResourceAndroidNotificationSound(soundResourceName),
  );

  final iosDetails = DarwinNotificationDetails(
    sound: '$soundResourceName.caf', // iOS uses the .caf files
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
  );

  final details = NotificationDetails(android: androidDetails, iOS: iosDetails);

  await _plugin.zonedSchedule(
    id,
    title,
    body,
    tz.TZDateTime.from(scheduledDateTime, tz.local),
    details,
    // Use exactAllowWhileIdle to ensure it rings even in power-saving mode
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: repeatComponents,
  );
}
  Future<void> showTestNotification() async {
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


  Future<bool> requestPermission() async {
    // Android 13+
    if (await Permission.notification.isDenied) {
      final status = await Permission.notification.request();
      return status.isGranted;
    }
    return true;
  }
  Future<void> cancel(int id) => _plugin.cancel(id);
  Future<void> cancelAll() => _plugin.cancelAll();
}
