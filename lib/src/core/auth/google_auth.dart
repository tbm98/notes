import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes/src/core/auth/auth.dart';
import 'package:notes/src/models/user_model.dart';

class GoogleAuth extends Auth {
  late final _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      return null;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<UserModel> signIn() async {
    final userCredential = await signInWithGoogle();
    if (userCredential == null || userCredential.user == null) {
      return const UserModel.guest();
    }
    return UserModel.fromFirebaseUser(userCredential.user!);
  }

  @override
  UserModel get currentUser {
    final fbCurrentUser = FirebaseAuth.instance.currentUser;
    if (fbCurrentUser == null) {
      return const UserModel.guest();
    }
    return UserModel.fromFirebaseUser(fbCurrentUser);
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
