import 'package:flutter_test/flutter_test.dart';
import 'package:notes/src/models/notification_model.dart';

void main() {
  test('test minimal NotificationModel', () {
    var notificationModel = NotificationModel.fromJson(
        const NotificationModel(id: 0, title: 'title', subTitle: 'subtitle')
            .toJson());
    expect(notificationModel.id, 0);
    expect(notificationModel.title, 'title');
    expect(notificationModel.subTitle, 'subtitle');
  });
}
