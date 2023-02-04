import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  int id;
  String phone;
  String pass;

  Person({
    required this.id,
    required this.phone,
    required this.pass,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person &&
        other.id == id &&
        other.phone == phone &&
        other.pass == pass;
  }

  @override
  int get hashCode => id.hashCode ^ phone.hashCode ^ pass.hashCode;

  Person copyWith({
    int? id,
    String? phone,
    String? pass,
  }) {
    return Person(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      pass: pass ?? this.pass,
    );
  }

  @override
  String toString() => 'Person(id: $id, phone: $phone, pass: $pass)';
}
