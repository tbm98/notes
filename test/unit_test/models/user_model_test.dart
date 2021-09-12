import 'package:flutter_test/flutter_test.dart';
import 'package:notes/src/models/user_model.dart';

void main() {
  test('test UserModel guest', () {
    const GuestUserModel userModel = UserModel.guest() as GuestUserModel;
    expect(userModel.getEmail, null);
  });

  test('test UserModel signedIn', () {
    const SignedInUserModel userModel =
        UserModel.signedIn(displayName: 'hi', email: 'email')
            as SignedInUserModel;
    expect(userModel.getEmail, 'email');
    expect(userModel.displayName, 'hi');
    expect(userModel.email, 'email');
    expect(userModel.avatarUrl, null);
  });

  test('test UserModel signedIn with avatar url', () {
    const SignedInUserModel userModel = UserModel.signedIn(
        displayName: 'hi',
        email: 'email',
        avatarUrl: 'avatar') as SignedInUserModel;
    expect(userModel.getEmail, 'email');
    expect(userModel.displayName, 'hi');
    expect(userModel.email, 'email');
    expect(userModel.avatarUrl, 'avatar');
  });
}
