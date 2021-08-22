import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/core/auth/auth.dart';
import 'package:notes/src/di/get_it.dart';
import 'package:notes/src/models/user.dart';

class ProfileNotifier extends StateNotifier<User> {
  ProfileNotifier({required User user, required this.auth}) : super(user);
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

final profileProvider = StateNotifierProvider<ProfileNotifier, User>((ref) {
  final auth = getIt<Auth>();
  final currentUser = auth.currentUser;
  return ProfileNotifier(user: currentUser, auth: auth);
});
