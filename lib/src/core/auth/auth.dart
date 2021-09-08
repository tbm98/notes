import 'package:notes/src/models/user_model.dart';

abstract class Auth {
  UserModel get currentUser;
  Future<UserModel> signIn();
  Future<void> signOut();
}
