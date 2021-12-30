// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'application_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
class _$AppUserTearOff {
  const _$AppUserTearOff();

  _AppUser call(
      {required String id, String? email, String? fullName, String? dorm}) {
    return _AppUser(
      id: id,
      email: email,
      fullName: fullName,
      dorm: dorm,
    );
  }

  AppUser fromJson(Map<String, Object?> json) {
    return AppUser.fromJson(json);
  }
}

/// @nodoc
const $AppUser = _$AppUserTearOff();

/// @nodoc
mixin _$AppUser {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get dorm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res>;
  $Res call({String id, String? email, String? fullName, String? dorm});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  final AppUser _value;
  // ignore: unused_field
  final $Res Function(AppUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? dorm = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      dorm: dorm == freezed
          ? _value.dorm
          : dorm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) then) =
      __$AppUserCopyWithImpl<$Res>;
  @override
  $Res call({String id, String? email, String? fullName, String? dorm});
}

/// @nodoc
class __$AppUserCopyWithImpl<$Res> extends _$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(_AppUser _value, $Res Function(_AppUser) _then)
      : super(_value, (v) => _then(v as _AppUser));

  @override
  _AppUser get _value => super._value as _AppUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? dorm = freezed,
  }) {
    return _then(_AppUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      dorm: dorm == freezed
          ? _value.dorm
          : dorm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser implements _AppUser {
  _$_AppUser({required this.id, this.email, this.fullName, this.dorm});

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? fullName;
  @override
  final String? dorm;

  @override
  String toString() {
    return 'AppUser(id: $id, email: $email, fullName: $fullName, dorm: $dorm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppUser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality().equals(other.dorm, dorm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(dorm));

  @JsonKey(ignore: true)
  @override
  _$AppUserCopyWith<_AppUser> get copyWith =>
      __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(this);
  }
}

abstract class _AppUser implements AppUser {
  factory _AppUser(
      {required String id,
      String? email,
      String? fullName,
      String? dorm}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String get id;
  @override
  String? get email;
  @override
  String? get fullName;
  @override
  String? get dorm;
  @override
  @JsonKey(ignore: true)
  _$AppUserCopyWith<_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}

PackageRequest _$PackageRequestFromJson(Map<String, dynamic> json) {
  return _PackageRequest.fromJson(json);
}

/// @nodoc
class _$PackageRequestTearOff {
  const _$PackageRequestTearOff();

  _PackageRequest call(
      {required Map<String, dynamic> user,
      String? status,
      required String packageSize,
      required String pickUpLocation,
      required String dropOffLocation,
      required String time}) {
    return _PackageRequest(
      user: user,
      status: status,
      packageSize: packageSize,
      pickUpLocation: pickUpLocation,
      dropOffLocation: dropOffLocation,
      time: time,
    );
  }

  PackageRequest fromJson(Map<String, Object?> json) {
    return PackageRequest.fromJson(json);
  }
}

/// @nodoc
const $PackageRequest = _$PackageRequestTearOff();

/// @nodoc
mixin _$PackageRequest {
  Map<String, dynamic> get user => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String get packageSize => throw _privateConstructorUsedError;
  String get pickUpLocation => throw _privateConstructorUsedError;
  String get dropOffLocation => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageRequestCopyWith<PackageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageRequestCopyWith<$Res> {
  factory $PackageRequestCopyWith(
          PackageRequest value, $Res Function(PackageRequest) then) =
      _$PackageRequestCopyWithImpl<$Res>;
  $Res call(
      {Map<String, dynamic> user,
      String? status,
      String packageSize,
      String pickUpLocation,
      String dropOffLocation,
      String time});
}

/// @nodoc
class _$PackageRequestCopyWithImpl<$Res>
    implements $PackageRequestCopyWith<$Res> {
  _$PackageRequestCopyWithImpl(this._value, this._then);

  final PackageRequest _value;
  // ignore: unused_field
  final $Res Function(PackageRequest) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? status = freezed,
    Object? packageSize = freezed,
    Object? pickUpLocation = freezed,
    Object? dropOffLocation = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      packageSize: packageSize == freezed
          ? _value.packageSize
          : packageSize // ignore: cast_nullable_to_non_nullable
              as String,
      pickUpLocation: pickUpLocation == freezed
          ? _value.pickUpLocation
          : pickUpLocation // ignore: cast_nullable_to_non_nullable
              as String,
      dropOffLocation: dropOffLocation == freezed
          ? _value.dropOffLocation
          : dropOffLocation // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PackageRequestCopyWith<$Res>
    implements $PackageRequestCopyWith<$Res> {
  factory _$PackageRequestCopyWith(
          _PackageRequest value, $Res Function(_PackageRequest) then) =
      __$PackageRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, dynamic> user,
      String? status,
      String packageSize,
      String pickUpLocation,
      String dropOffLocation,
      String time});
}

/// @nodoc
class __$PackageRequestCopyWithImpl<$Res>
    extends _$PackageRequestCopyWithImpl<$Res>
    implements _$PackageRequestCopyWith<$Res> {
  __$PackageRequestCopyWithImpl(
      _PackageRequest _value, $Res Function(_PackageRequest) _then)
      : super(_value, (v) => _then(v as _PackageRequest));

  @override
  _PackageRequest get _value => super._value as _PackageRequest;

  @override
  $Res call({
    Object? user = freezed,
    Object? status = freezed,
    Object? packageSize = freezed,
    Object? pickUpLocation = freezed,
    Object? dropOffLocation = freezed,
    Object? time = freezed,
  }) {
    return _then(_PackageRequest(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      packageSize: packageSize == freezed
          ? _value.packageSize
          : packageSize // ignore: cast_nullable_to_non_nullable
              as String,
      pickUpLocation: pickUpLocation == freezed
          ? _value.pickUpLocation
          : pickUpLocation // ignore: cast_nullable_to_non_nullable
              as String,
      dropOffLocation: dropOffLocation == freezed
          ? _value.dropOffLocation
          : dropOffLocation // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageRequest implements _PackageRequest {
  _$_PackageRequest(
      {required this.user,
      this.status,
      required this.packageSize,
      required this.pickUpLocation,
      required this.dropOffLocation,
      required this.time});

  factory _$_PackageRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PackageRequestFromJson(json);

  @override
  final Map<String, dynamic> user;
  @override
  final String? status;
  @override
  final String packageSize;
  @override
  final String pickUpLocation;
  @override
  final String dropOffLocation;
  @override
  final String time;

  @override
  String toString() {
    return 'PackageRequest(user: $user, status: $status, packageSize: $packageSize, pickUpLocation: $pickUpLocation, dropOffLocation: $dropOffLocation, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackageRequest &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.packageSize, packageSize) &&
            const DeepCollectionEquality()
                .equals(other.pickUpLocation, pickUpLocation) &&
            const DeepCollectionEquality()
                .equals(other.dropOffLocation, dropOffLocation) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(packageSize),
      const DeepCollectionEquality().hash(pickUpLocation),
      const DeepCollectionEquality().hash(dropOffLocation),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$PackageRequestCopyWith<_PackageRequest> get copyWith =>
      __$PackageRequestCopyWithImpl<_PackageRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageRequestToJson(this);
  }
}

abstract class _PackageRequest implements PackageRequest {
  factory _PackageRequest(
      {required Map<String, dynamic> user,
      String? status,
      required String packageSize,
      required String pickUpLocation,
      required String dropOffLocation,
      required String time}) = _$_PackageRequest;

  factory _PackageRequest.fromJson(Map<String, dynamic> json) =
      _$_PackageRequest.fromJson;

  @override
  Map<String, dynamic> get user;
  @override
  String? get status;
  @override
  String get packageSize;
  @override
  String get pickUpLocation;
  @override
  String get dropOffLocation;
  @override
  String get time;
  @override
  @JsonKey(ignore: true)
  _$PackageRequestCopyWith<_PackageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

  _Location call({required String latitude, required String longitude}) {
    return _Location(
      latitude: latitude,
      longitude: longitude,
    );
  }

  Location fromJson(Map<String, Object?> json) {
    return Location.fromJson(json);
  }
}

/// @nodoc
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call({String latitude, String longitude});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call({String latitude, String longitude});
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_Location(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  _$_Location({required this.latitude, required this.longitude});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  final String latitude;
  @override
  final String longitude;

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Location &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(this);
  }
}

abstract class _Location implements Location {
  factory _Location({required String latitude, required String longitude}) =
      _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  String get latitude;
  @override
  String get longitude;
  @override
  @JsonKey(ignore: true)
  _$LocationCopyWith<_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
