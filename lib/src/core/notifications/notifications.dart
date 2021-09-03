import 'package:notes/src/models/notification_model.dart';

abstract class Notifications {
  void showNotification({required NotificationModel notificationModel});

  void scheduleNotification({
    required NotificationModel notificationModel,
    required DateTime dateTime,
  });

  Future<bool> requestPermissions();

  Future<void> cancelAllNotifications();

  Future<void> cancelNotification(int id);
}
