import 'package:notes/src/core/auth/auth.dart';
import 'package:notes/src/models/user_model.dart';

class FakeAuth extends Auth {
  UserModel _currentUser = const UserModel.guest();

  @override
  Future<UserModel> signIn() async {
    _currentUser = const UserModel.signedIn(
        displayName: 'tbm98', email: 'tbm98.dev@gmail.com');
    return _currentUser;
  }

  @override
  UserModel get currentUser {
    return _currentUser;
  }

  @override
  Future<void> signOut() async {
    _currentUser = const UserModel.guest();
  }
}
