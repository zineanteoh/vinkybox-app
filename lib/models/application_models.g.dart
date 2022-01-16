// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      id: json['id'] as String,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      dorm: json['dorm'] as String?,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'dorm': instance.dorm,
    };

_$_PackageRequest _$$_PackageRequestFromJson(Map<String, dynamic> json) =>
    _$_PackageRequest(
      id: json['id'] as String?,
      user: json['user'] as Map<String, dynamic>,
      status: json['status'] as String,
      packageSize: json['packageSize'] as String,
      pickUpLocation: json['pickUpLocation'] as String,
      dropOffLocation: json['dropOffLocation'] as String,
      time: json['time'] as String,
      statusAccepted:
          json['statusAccepted'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$_PackageRequestToJson(_$_PackageRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'status': instance.status,
      'packageSize': instance.packageSize,
      'pickUpLocation': instance.pickUpLocation,
      'dropOffLocation': instance.dropOffLocation,
      'time': instance.time,
      'statusAccepted': instance.statusAccepted,
    };

_$_PackageRequestList _$$_PackageRequestListFromJson(
        Map<String, dynamic> json) =>
    _$_PackageRequestList(
      requestList: (json['requestList'] as List<dynamic>)
          .map((e) => PackageRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PackageRequestListToJson(
        _$_PackageRequestList instance) =>
    <String, dynamic>{
      'requestList': instance.requestList,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
