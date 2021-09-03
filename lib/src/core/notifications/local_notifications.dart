import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notes/src/config/global_constant.dart';
import 'package:notes/src/core/notifications/notifications.dart';
import 'package:notes/src/models/notification_model.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications extends Notifications {
  LocalNotifications() {
    init();
  }

  Completer ready = Completer();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('app_icon');
  final IOSInitializationSettings initializationSettingsIOS =
      const IOSInitializationSettings();
  final MacOSInitializationSettings initializationSettingsMacOS =
      const MacOSInitializationSettings();
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      const AndroidNotificationDetails(notificationChannelId,
          notificationChannelName, notificationChannelDescription,
          importance: Importance.max, priority: Priority.high, showWhen: false);
  late NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  Future<void> init() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
    tz.initializeTimeZones();
    // tz.setLocalLocation(tz.getLocation('Asia/Ho_Chi_Minh'));
    ready.complete();
  }

  @override
  void scheduleNotification({
    required NotificationModel notificationModel,
    required DateTime dateTime,
  }) async {
    await ready.future;
    await requestPermissions();
    flutterLocalNotificationsPlugin.zonedSchedule(
        notificationModel.id,
        notificationModel.title,
        notificationModel.subTitle,
        tz.TZDateTime.from(dateTime, tz.local),
        NotificationDetails(android: androidPlatformChannelSpecifics),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  @override
  void showNotification({required NotificationModel notificationModel}) async {
    await ready.future;
    await requestPermissions();
    flutterLocalNotificationsPlugin.show(
      notificationModel.id,
      notificationModel.title,
      notificationModel.subTitle,
      platformChannelSpecifics,
    );
  }

  @override
  Future<bool> requestPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    return true;
  }

  @override
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  @override
  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
