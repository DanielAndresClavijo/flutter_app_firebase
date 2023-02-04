// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteInfo _$RouteInfoFromJson(Map<String, dynamic> json) => RouteInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      distance: json['distance'] as int,
    );

Map<String, dynamic> _$RouteInfoToJson(RouteInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'distance': instance.distance,
    };
