// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignedInUserModel _$$SignedInUserModelFromJson(Map<String, dynamic> json) =>
    _$SignedInUserModel(
      displayName: json['display_name'] as String?,
      email: json['email'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$$SignedInUserModelToJson(_$SignedInUserModel instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
    };

_$GuestUserModel _$$GuestUserModelFromJson(Map<String, dynamic> json) =>
    _$GuestUserModel();

Map<String, dynamic> _$$GuestUserModelToJson(_$GuestUserModel instance) =>
    <String, dynamic>{};
