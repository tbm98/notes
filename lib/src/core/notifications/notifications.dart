import 'package:notes/src/models/notification_model.dart';

abstract class Notifications {
  void showNotification({required NotificationModel notificationModel});

  void scheduleNotification({
    required NotificationModel notificationModel,
    required DateTime dateTime,
  });
}