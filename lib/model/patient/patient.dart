import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  String? name;
  String? phoneNumber;
  DateTime? dateOfBirth;
  String? email;
  String? avatarUrl;

  Patient({
    this.name,
    this.phoneNumber,
    this.avatarUrl,
    this.dateOfBirth,
    this.email,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
