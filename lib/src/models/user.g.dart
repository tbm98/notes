// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignedInUser _$_$SignedInUserFromJson(Map<String, dynamic> json) {
  return _$SignedInUser(
    displayName: json['display_name'] as String?,
    email: json['email'] as String?,
    avatarUrl: json['avatar_url'] as String?,
  );
}

Map<String, dynamic> _$_$SignedInUserToJson(_$SignedInUser instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
    };

_$GuestUser _$_$GuestUserFromJson(Map<String, dynamic> json) {
  return _$GuestUser();
}

Map<String, dynamic> _$_$GuestUserToJson(_$GuestUser instance) =>
    <String, dynamic>{};
