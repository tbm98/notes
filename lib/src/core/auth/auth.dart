import 'package:notes/src/models/user.dart';

abstract class Auth {
  User get currentUser;
  Future<User> signIn();
  Future<void> signOut();
}
