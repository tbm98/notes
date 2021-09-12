import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/core/auth/auth.dart';
import 'package:notes/src/di/get_it.dart';
import 'package:notes/src/models/user_model.dart';

class ProfileNotifier extends StateNotifier<UserModel> {
  ProfileNotifier({required UserModel user, required this.auth}) : super(user);
  final Auth auth;

  Future<void> signIn() async {
    final signInResult = await auth.signIn();
    state = signInResult;
  }

  Future<void> signOut() async {
    await auth.signOut();
    state = auth.currentUser;
  }
}

final profileProvider =
    StateNotifierProvider<ProfileNotifier, UserModel>((ref) {
  final auth = getIt<Auth>();
  final currentUser = auth.currentUser;
  return ProfileNotifier(user: currentUser, auth: auth);
});
