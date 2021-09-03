// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'signedIn':
      return SignedInUser.fromJson(json);
    case 'guest':
      return GuestUser.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  SignedInUser signedIn(
      {required String? displayName,
      required String? email,
      String? avatarUrl}) {
    return SignedInUser(
      displayName: displayName,
      email: email,
      avatarUrl: avatarUrl,
    );
  }

  GuestUser guest() {
    return const GuestUser();
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? displayName, String? email, String? avatarUrl)
        signedIn,
    required TResult Function() guest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? displayName, String? email, String? avatarUrl)?
        signedIn,
    TResult Function()? guest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignedInUser value) signedIn,
    required TResult Function(GuestUser value) guest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignedInUser value)? signedIn,
    TResult Function(GuestUser value)? guest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;
}

/// @nodoc
abstract class $SignedInUserCopyWith<$Res> {
  factory $SignedInUserCopyWith(
          SignedInUser value, $Res Function(SignedInUser) then) =
      _$SignedInUserCopyWithImpl<$Res>;
  $Res call({String? displayName, String? email, String? avatarUrl});
}

/// @nodoc
class _$SignedInUserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements $SignedInUserCopyWith<$Res> {
  _$SignedInUserCopyWithImpl(
      SignedInUser _value, $Res Function(SignedInUser) _then)
      : super(_value, (v) => _then(v as SignedInUser));

  @override
  SignedInUser get _value => super._value as SignedInUser;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? email = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(SignedInUser(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$SignedInUser extends SignedInUser with DiagnosticableTreeMixin {
  const _$SignedInUser(
      {required this.displayName, required this.email, this.avatarUrl})
      : super._();

  factory _$SignedInUser.fromJson(Map<String, dynamic> json) =>
      _$_$SignedInUserFromJson(json);

  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final String? avatarUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User.signedIn(displayName: $displayName, email: $email, avatarUrl: $avatarUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User.signedIn'))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('avatarUrl', avatarUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignedInUser &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.avatarUrl, avatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.avatarUrl, avatarUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(avatarUrl);

  @JsonKey(ignore: true)
  @override
  $SignedInUserCopyWith<SignedInUser> get copyWith =>
      _$SignedInUserCopyWithImpl<SignedInUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? displayName, String? email, String? avatarUrl)
        signedIn,
    required TResult Function() guest,
  }) {
    return signedIn(displayName, email, avatarUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? displayName, String? email, String? avatarUrl)?
        signedIn,
    TResult Function()? guest,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(displayName, email, avatarUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignedInUser value) signedIn,
    required TResult Function(GuestUser value) guest,
  }) {
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignedInUser value)? signedIn,
    TResult Function(GuestUser value)? guest,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$SignedInUserToJson(this)..['runtimeType'] = 'signedIn';
  }
}

abstract class SignedInUser extends User {
  const factory SignedInUser(
      {required String? displayName,
      required String? email,
      String? avatarUrl}) = _$SignedInUser;
  const SignedInUser._() : super._();

  factory SignedInUser.fromJson(Map<String, dynamic> json) =
      _$SignedInUser.fromJson;

  String? get displayName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignedInUserCopyWith<SignedInUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestUserCopyWith<$Res> {
  factory $GuestUserCopyWith(GuestUser value, $Res Function(GuestUser) then) =
      _$GuestUserCopyWithImpl<$Res>;
}

/// @nodoc
class _$GuestUserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements $GuestUserCopyWith<$Res> {
  _$GuestUserCopyWithImpl(GuestUser _value, $Res Function(GuestUser) _then)
      : super(_value, (v) => _then(v as GuestUser));

  @override
  GuestUser get _value => super._value as GuestUser;
}

/// @nodoc
@JsonSerializable()
class _$GuestUser extends GuestUser with DiagnosticableTreeMixin {
  const _$GuestUser() : super._();

  factory _$GuestUser.fromJson(Map<String, dynamic> json) =>
      _$_$GuestUserFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User.guest()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'User.guest'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GuestUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? displayName, String? email, String? avatarUrl)
        signedIn,
    required TResult Function() guest,
  }) {
    return guest();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? displayName, String? email, String? avatarUrl)?
        signedIn,
    TResult Function()? guest,
    required TResult orElse(),
  }) {
    if (guest != null) {
      return guest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignedInUser value) signedIn,
    required TResult Function(GuestUser value) guest,
  }) {
    return guest(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignedInUser value)? signedIn,
    TResult Function(GuestUser value)? guest,
    required TResult orElse(),
  }) {
    if (guest != null) {
      return guest(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$GuestUserToJson(this)..['runtimeType'] = 'guest';
  }
}

abstract class GuestUser extends User {
  const factory GuestUser() = _$GuestUser;
  const GuestUser._() : super._();

  factory GuestUser.fromJson(Map<String, dynamic> json) = _$GuestUser.fromJson;
}
