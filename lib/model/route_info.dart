import 'package:json_annotation/json_annotation.dart';

part 'route_info.g.dart';

@JsonSerializable()
class RouteInfo {
  int id;
  String name;
  int distance;

  RouteInfo({
    required this.id,
    required this.name,
    required this.distance,
  });

  /// Connect the generated [_$RouteInfoFromJson] function to the `fromJson`
  /// factory.
  factory RouteInfo.fromJson(Map<String, dynamic> json) =>
      _$RouteInfoFromJson(json);

  /// Connect the generated [_$RouteInfoToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RouteInfoToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RouteInfo &&
        other.id == id &&
        other.name == name &&
        other.distance == distance;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ distance.hashCode;

  RouteInfo copyWith({
    int? id,
    String? name,
    int? distance,
  }) {
    return RouteInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      distance: distance ?? this.distance,
    );
  }

  @override
  String toString() => 'RouteInfo(id: $id, name: $name, distance: $distance)';
}
