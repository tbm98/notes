import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserModel.signedIn({
    required String? displayName,
    required String? email,
    String? avatarUrl,
  }) = SignedInUserModel;

  String? get getEmail {
    return map(signedIn: (value) => value.email, guest: (_) => null);
  }

  const factory UserModel.guest() = GuestUserModel;

  factory UserModel.fromFirebaseUser(fb.User user) {
    return UserModel.signedIn(
        displayName: user.displayName,
        email: user.email,
        avatarUrl: user.photoURL);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
