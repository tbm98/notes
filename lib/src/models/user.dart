import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory User.signedIn({
    required String? displayName,
    required String? email,
    String? avatarUrl,
  }) = SignedInUser;

  String? get getEmail {
    return map(signedIn: (value) => value.email, guest: (_) => null);
  }

  const factory User.guest() = GuestUser;

  factory User.fromFirebaseUser(fb.User user) {
    return User.signedIn(
        displayName: user.displayName,
        email: user.email,
        avatarUrl: user.photoURL);
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
