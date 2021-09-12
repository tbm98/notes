import 'package:notes/src/models/user_model.dart';

import 'widget_test.mocks.dart';

final mockAuth = MockAuth();
final mockStorage = MockStorage();
final mockNotifications = MockNotifications();
final mockShareHandler = MockShareHandler();

const SignedInUserModel userSignedIn = UserModel.signedIn(
    displayName: 'minh',
    email: 'tbm98@gmail.com',
    avatarUrl: 'url') as SignedInUserModel;
const userGuest = UserModel.guest();
