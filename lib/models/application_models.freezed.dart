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
      {required String id,
      String? email,
      String? fullName,
      String? dorm,
      int packageSentCount = 0,
      int packageReceivedCount = 0,
      List<PackageHistoryItem> packageHistory = const []}) {
    return _AppUser(
      id: id,
      email: email,
      fullName: fullName,
      dorm: dorm,
      packageSentCount: packageSentCount,
      packageReceivedCount: packageReceivedCount,
      packageHistory: packageHistory,
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
  int get packageSentCount => throw _privateConstructorUsedError;
  int get packageReceivedCount => throw _privateConstructorUsedError;
  List<PackageHistoryItem> get packageHistory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? email,
      String? fullName,
      String? dorm,
      int packageSentCount,
      int packageReceivedCount,
      List<PackageHistoryItem> packageHistory});
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
    Object? packageSentCount = freezed,
    Object? packageReceivedCount = freezed,
    Object? packageHistory = freezed,
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
      packageSentCount: packageSentCount == freezed
          ? _value.packageSentCount
          : packageSentCount // ignore: cast_nullable_to_non_nullable
              as int,
      packageReceivedCount: packageReceivedCount == freezed
          ? _value.packageReceivedCount
          : packageReceivedCount // ignore: cast_nullable_to_non_nullable
              as int,
      packageHistory: packageHistory == freezed
          ? _value.packageHistory
          : packageHistory // ignore: cast_nullable_to_non_nullable
              as List<PackageHistoryItem>,
    ));
  }
}

/// @nodoc
abstract class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) then) =
      __$AppUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? email,
      String? fullName,
      String? dorm,
      int packageSentCount,
      int packageReceivedCount,
      List<PackageHistoryItem> packageHistory});
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
    Object? packageSentCount = freezed,
    Object? packageReceivedCount = freezed,
    Object? packageHistory = freezed,
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
      packageSentCount: packageSentCount == freezed
          ? _value.packageSentCount
          : packageSentCount // ignore: cast_nullable_to_non_nullable
              as int,
      packageReceivedCount: packageReceivedCount == freezed
          ? _value.packageReceivedCount
          : packageReceivedCount // ignore: cast_nullable_to_non_nullable
              as int,
      packageHistory: packageHistory == freezed
          ? _value.packageHistory
          : packageHistory // ignore: cast_nullable_to_non_nullable
              as List<PackageHistoryItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser implements _AppUser {
  _$_AppUser(
      {required this.id,
      this.email,
      this.fullName,
      this.dorm,
      this.packageSentCount = 0,
      this.packageReceivedCount = 0,
      this.packageHistory = const []});

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
  @JsonKey()
  @override
  final int packageSentCount;
  @JsonKey()
  @override
  final int packageReceivedCount;
  @JsonKey()
  @override
  final List<PackageHistoryItem> packageHistory;

  @override
  String toString() {
    return 'AppUser(id: $id, email: $email, fullName: $fullName, dorm: $dorm, packageSentCount: $packageSentCount, packageReceivedCount: $packageReceivedCount, packageHistory: $packageHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppUser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality().equals(other.dorm, dorm) &&
            const DeepCollectionEquality()
                .equals(other.packageSentCount, packageSentCount) &&
            const DeepCollectionEquality()
                .equals(other.packageReceivedCount, packageReceivedCount) &&
            const DeepCollectionEquality()
                .equals(other.packageHistory, packageHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(dorm),
      const DeepCollectionEquality().hash(packageSentCount),
      const DeepCollectionEquality().hash(packageReceivedCount),
      const DeepCollectionEquality().hash(packageHistory));

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
      String? dorm,
      int packageSentCount,
      int packageReceivedCount,
      List<PackageHistoryItem> packageHistory}) = _$_AppUser;

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
  int get packageSentCount;
  @override
  int get packageReceivedCount;
  @override
  List<PackageHistoryItem> get packageHistory;
  @override
  @JsonKey(ignore: true)
  _$AppUserCopyWith<_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}

PackageHistoryItem _$PackageHistoryItemFromJson(Map<String, dynamic> json) {
  return _PackageHistoryItem.fromJson(json);
}

/// @nodoc
class _$PackageHistoryItemTearOff {
  const _$PackageHistoryItemTearOff();

  _PackageHistoryItem call(
      {required String id,
      required String packageSize,
      required String pickUpLocation,
      required String dropOffLocation,
      required String dateCompleted}) {
    return _PackageHistoryItem(
      id: id,
      packageSize: packageSize,
      pickUpLocation: pickUpLocation,
      dropOffLocation: dropOffLocation,
      dateCompleted: dateCompleted,
    );
  }

  PackageHistoryItem fromJson(Map<String, Object?> json) {
    return PackageHistoryItem.fromJson(json);
  }
}

/// @nodoc
const $PackageHistoryItem = _$PackageHistoryItemTearOff();

/// @nodoc
mixin _$PackageHistoryItem {
  String get id => throw _privateConstructorUsedError;
  String get packageSize => throw _privateConstructorUsedError;
  String get pickUpLocation => throw _privateConstructorUsedError;
  String get dropOffLocation => throw _privateConstructorUsedError;
  String get dateCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageHistoryItemCopyWith<PackageHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageHistoryItemCopyWith<$Res> {
  factory $PackageHistoryItemCopyWith(
          PackageHistoryItem value, $Res Function(PackageHistoryItem) then) =
      _$PackageHistoryItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String packageSize,
      String pickUpLocation,
      String dropOffLocation,
      String dateCompleted});
}

/// @nodoc
class _$PackageHistoryItemCopyWithImpl<$Res>
    implements $PackageHistoryItemCopyWith<$Res> {
  _$PackageHistoryItemCopyWithImpl(this._value, this._then);

  final PackageHistoryItem _value;
  // ignore: unused_field
  final $Res Function(PackageHistoryItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? packageSize = freezed,
    Object? pickUpLocation = freezed,
    Object? dropOffLocation = freezed,
    Object? dateCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      dateCompleted: dateCompleted == freezed
          ? _value.dateCompleted
          : dateCompleted // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PackageHistoryItemCopyWith<$Res>
    implements $PackageHistoryItemCopyWith<$Res> {
  factory _$PackageHistoryItemCopyWith(
          _PackageHistoryItem value, $Res Function(_PackageHistoryItem) then) =
      __$PackageHistoryItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String packageSize,
      String pickUpLocation,
      String dropOffLocation,
      String dateCompleted});
}

/// @nodoc
class __$PackageHistoryItemCopyWithImpl<$Res>
    extends _$PackageHistoryItemCopyWithImpl<$Res>
    implements _$PackageHistoryItemCopyWith<$Res> {
  __$PackageHistoryItemCopyWithImpl(
      _PackageHistoryItem _value, $Res Function(_PackageHistoryItem) _then)
      : super(_value, (v) => _then(v as _PackageHistoryItem));

  @override
  _PackageHistoryItem get _value => super._value as _PackageHistoryItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? packageSize = freezed,
    Object? pickUpLocation = freezed,
    Object? dropOffLocation = freezed,
    Object? dateCompleted = freezed,
  }) {
    return _then(_PackageHistoryItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      dateCompleted: dateCompleted == freezed
          ? _value.dateCompleted
          : dateCompleted // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageHistoryItem implements _PackageHistoryItem {
  _$_PackageHistoryItem(
      {required this.id,
      required this.packageSize,
      required this.pickUpLocation,
      required this.dropOffLocation,
      required this.dateCompleted});

  factory _$_PackageHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$$_PackageHistoryItemFromJson(json);

  @override
  final String id;
  @override
  final String packageSize;
  @override
  final String pickUpLocation;
  @override
  final String dropOffLocation;
  @override
  final String dateCompleted;

  @override
  String toString() {
    return 'PackageHistoryItem(id: $id, packageSize: $packageSize, pickUpLocation: $pickUpLocation, dropOffLocation: $dropOffLocation, dateCompleted: $dateCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackageHistoryItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.packageSize, packageSize) &&
            const DeepCollectionEquality()
                .equals(other.pickUpLocation, pickUpLocation) &&
            const DeepCollectionEquality()
                .equals(other.dropOffLocation, dropOffLocation) &&
            const DeepCollectionEquality()
                .equals(other.dateCompleted, dateCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(packageSize),
      const DeepCollectionEquality().hash(pickUpLocation),
      const DeepCollectionEquality().hash(dropOffLocation),
      const DeepCollectionEquality().hash(dateCompleted));

  @JsonKey(ignore: true)
  @override
  _$PackageHistoryItemCopyWith<_PackageHistoryItem> get copyWith =>
      __$PackageHistoryItemCopyWithImpl<_PackageHistoryItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageHistoryItemToJson(this);
  }
}

abstract class _PackageHistoryItem implements PackageHistoryItem {
  factory _PackageHistoryItem(
      {required String id,
      required String packageSize,
      required String pickUpLocation,
      required String dropOffLocation,
      required String dateCompleted}) = _$_PackageHistoryItem;

  factory _PackageHistoryItem.fromJson(Map<String, dynamic> json) =
      _$_PackageHistoryItem.fromJson;

  @override
  String get id;
  @override
  String get packageSize;
  @override
  String get pickUpLocation;
  @override
  String get dropOffLocation;
  @override
  String get dateCompleted;
  @override
  @JsonKey(ignore: true)
  _$PackageHistoryItemCopyWith<_PackageHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

PackageRequest _$PackageRequestFromJson(Map<String, dynamic> json) {
  return _PackageRequest.fromJson(json);
}

/// @nodoc
class _$PackageRequestTearOff {
  const _$PackageRequestTearOff();

  _PackageRequest call(
      {String? id,
      required Map<String, dynamic> user,
      required String status,
      required String packageSize,
      required String pickUpLocation,
      required String dropOffLocation,
      required String time,
      Map<String, dynamic> statusAccepted = const {}}) {
    return _PackageRequest(
      id: id,
      user: user,
      status: status,
      packageSize: packageSize,
      pickUpLocation: pickUpLocation,
      dropOffLocation: dropOffLocation,
      time: time,
      statusAccepted: statusAccepted,
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
  String? get id => throw _privateConstructorUsedError;
  Map<String, dynamic> get user => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get packageSize => throw _privateConstructorUsedError;
  String get pickUpLocation => throw _privateConstructorUsedError;
  String get dropOffLocation => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  Map<String, dynamic> get statusAccepted => throw _privateConstructorUsedError;

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
      {String? id,
      Map<String, dynamic> user,
      String status,
      String packageSize,
      String pickUpLocation,
      String dropOffLocation,
      String time,
      Map<String, dynamic> statusAccepted});
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
    Object? id = freezed,
    Object? user = freezed,
    Object? status = freezed,
    Object? packageSize = freezed,
    Object? pickUpLocation = freezed,
    Object? dropOffLocation = freezed,
    Object? time = freezed,
    Object? statusAccepted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
      statusAccepted: statusAccepted == freezed
          ? _value.statusAccepted
          : statusAccepted // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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
      {String? id,
      Map<String, dynamic> user,
      String status,
      String packageSize,
      String pickUpLocation,
      String dropOffLocation,
      String time,
      Map<String, dynamic> statusAccepted});
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
    Object? id = freezed,
    Object? user = freezed,
    Object? status = freezed,
    Object? packageSize = freezed,
    Object? pickUpLocation = freezed,
    Object? dropOffLocation = freezed,
    Object? time = freezed,
    Object? statusAccepted = freezed,
  }) {
    return _then(_PackageRequest(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
      statusAccepted: statusAccepted == freezed
          ? _value.statusAccepted
          : statusAccepted // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageRequest extends _PackageRequest {
  _$_PackageRequest(
      {this.id,
      required this.user,
      required this.status,
      required this.packageSize,
      required this.pickUpLocation,
      required this.dropOffLocation,
      required this.time,
      this.statusAccepted = const {}})
      : super._();

  factory _$_PackageRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PackageRequestFromJson(json);

  @override
  final String? id;
  @override
  final Map<String, dynamic> user;
  @override
  final String status;
  @override
  final String packageSize;
  @override
  final String pickUpLocation;
  @override
  final String dropOffLocation;
  @override
  final String time;
  @JsonKey()
  @override
  final Map<String, dynamic> statusAccepted;

  @override
  String toString() {
    return 'PackageRequest(id: $id, user: $user, status: $status, packageSize: $packageSize, pickUpLocation: $pickUpLocation, dropOffLocation: $dropOffLocation, time: $time, statusAccepted: $statusAccepted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackageRequest &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.packageSize, packageSize) &&
            const DeepCollectionEquality()
                .equals(other.pickUpLocation, pickUpLocation) &&
            const DeepCollectionEquality()
                .equals(other.dropOffLocation, dropOffLocation) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.statusAccepted, statusAccepted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(packageSize),
      const DeepCollectionEquality().hash(pickUpLocation),
      const DeepCollectionEquality().hash(dropOffLocation),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(statusAccepted));

  @JsonKey(ignore: true)
  @override
  _$PackageRequestCopyWith<_PackageRequest> get copyWith =>
      __$PackageRequestCopyWithImpl<_PackageRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageRequestToJson(this);
  }
}

abstract class _PackageRequest extends PackageRequest {
  factory _PackageRequest(
      {String? id,
      required Map<String, dynamic> user,
      required String status,
      required String packageSize,
      required String pickUpLocation,
      required String dropOffLocation,
      required String time,
      Map<String, dynamic> statusAccepted}) = _$_PackageRequest;
  _PackageRequest._() : super._();

  factory _PackageRequest.fromJson(Map<String, dynamic> json) =
      _$_PackageRequest.fromJson;

  @override
  String? get id;
  @override
  Map<String, dynamic> get user;
  @override
  String get status;
  @override
  String get packageSize;
  @override
  String get pickUpLocation;
  @override
  String get dropOffLocation;
  @override
  String get time;
  @override
  Map<String, dynamic> get statusAccepted;
  @override
  @JsonKey(ignore: true)
  _$PackageRequestCopyWith<_PackageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

PackageRequestList _$PackageRequestListFromJson(Map<String, dynamic> json) {
  return _PackageRequestList.fromJson(json);
}

/// @nodoc
class _$PackageRequestListTearOff {
  const _$PackageRequestListTearOff();

  _PackageRequestList call({List<PackageRequest> requestList = const []}) {
    return _PackageRequestList(
      requestList: requestList,
    );
  }

  PackageRequestList fromJson(Map<String, Object?> json) {
    return PackageRequestList.fromJson(json);
  }
}

/// @nodoc
const $PackageRequestList = _$PackageRequestListTearOff();

/// @nodoc
mixin _$PackageRequestList {
  List<PackageRequest> get requestList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageRequestListCopyWith<PackageRequestList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageRequestListCopyWith<$Res> {
  factory $PackageRequestListCopyWith(
          PackageRequestList value, $Res Function(PackageRequestList) then) =
      _$PackageRequestListCopyWithImpl<$Res>;
  $Res call({List<PackageRequest> requestList});
}

/// @nodoc
class _$PackageRequestListCopyWithImpl<$Res>
    implements $PackageRequestListCopyWith<$Res> {
  _$PackageRequestListCopyWithImpl(this._value, this._then);

  final PackageRequestList _value;
  // ignore: unused_field
  final $Res Function(PackageRequestList) _then;

  @override
  $Res call({
    Object? requestList = freezed,
  }) {
    return _then(_value.copyWith(
      requestList: requestList == freezed
          ? _value.requestList
          : requestList // ignore: cast_nullable_to_non_nullable
              as List<PackageRequest>,
    ));
  }
}

/// @nodoc
abstract class _$PackageRequestListCopyWith<$Res>
    implements $PackageRequestListCopyWith<$Res> {
  factory _$PackageRequestListCopyWith(
          _PackageRequestList value, $Res Function(_PackageRequestList) then) =
      __$PackageRequestListCopyWithImpl<$Res>;
  @override
  $Res call({List<PackageRequest> requestList});
}

/// @nodoc
class __$PackageRequestListCopyWithImpl<$Res>
    extends _$PackageRequestListCopyWithImpl<$Res>
    implements _$PackageRequestListCopyWith<$Res> {
  __$PackageRequestListCopyWithImpl(
      _PackageRequestList _value, $Res Function(_PackageRequestList) _then)
      : super(_value, (v) => _then(v as _PackageRequestList));

  @override
  _PackageRequestList get _value => super._value as _PackageRequestList;

  @override
  $Res call({
    Object? requestList = freezed,
  }) {
    return _then(_PackageRequestList(
      requestList: requestList == freezed
          ? _value.requestList
          : requestList // ignore: cast_nullable_to_non_nullable
              as List<PackageRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageRequestList implements _PackageRequestList {
  _$_PackageRequestList({this.requestList = const []});

  factory _$_PackageRequestList.fromJson(Map<String, dynamic> json) =>
      _$$_PackageRequestListFromJson(json);

  @JsonKey()
  @override
  final List<PackageRequest> requestList;

  @override
  String toString() {
    return 'PackageRequestList(requestList: $requestList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackageRequestList &&
            const DeepCollectionEquality()
                .equals(other.requestList, requestList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(requestList));

  @JsonKey(ignore: true)
  @override
  _$PackageRequestListCopyWith<_PackageRequestList> get copyWith =>
      __$PackageRequestListCopyWithImpl<_PackageRequestList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageRequestListToJson(this);
  }
}

abstract class _PackageRequestList implements PackageRequestList {
  factory _PackageRequestList({List<PackageRequest> requestList}) =
      _$_PackageRequestList;

  factory _PackageRequestList.fromJson(Map<String, dynamic> json) =
      _$_PackageRequestList.fromJson;

  @override
  List<PackageRequest> get requestList;
  @override
  @JsonKey(ignore: true)
  _$PackageRequestListCopyWith<_PackageRequestList> get copyWith =>
      throw _privateConstructorUsedError;
}

AppLocation _$AppLocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
class _$AppLocationTearOff {
  const _$AppLocationTearOff();

  _Location call({required String latitude, required String longitude}) {
    return _Location(
      latitude: latitude,
      longitude: longitude,
    );
  }

  AppLocation fromJson(Map<String, Object?> json) {
    return AppLocation.fromJson(json);
  }
}

/// @nodoc
const $AppLocation = _$AppLocationTearOff();

/// @nodoc
mixin _$AppLocation {
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppLocationCopyWith<AppLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLocationCopyWith<$Res> {
  factory $AppLocationCopyWith(
          AppLocation value, $Res Function(AppLocation) then) =
      _$AppLocationCopyWithImpl<$Res>;
  $Res call({String latitude, String longitude});
}

/// @nodoc
class _$AppLocationCopyWithImpl<$Res> implements $AppLocationCopyWith<$Res> {
  _$AppLocationCopyWithImpl(this._value, this._then);

  final AppLocation _value;
  // ignore: unused_field
  final $Res Function(AppLocation) _then;

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
abstract class _$LocationCopyWith<$Res> implements $AppLocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call({String latitude, String longitude});
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$AppLocationCopyWithImpl<$Res>
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
    return 'AppLocation(latitude: $latitude, longitude: $longitude)';
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

abstract class _Location implements AppLocation {
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
