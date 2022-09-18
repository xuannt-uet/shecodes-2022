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

@JsonSerializable()
class PatientResponse {
  Patient? user;
  String? token;
  String? session;

  PatientResponse({
    this.user,
    this.session,
    this.token,
  });

  factory PatientResponse.fromJson(Map<String, dynamic> json) => _$PatientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PatientResponseToJson(this);
}

@JsonSerializable()
class PatientRegisterResponse {
  Patient? result;
  bool? success;

  PatientRegisterResponse({this.result, this.success});

  factory PatientRegisterResponse.fromJson(Map<String, dynamic> json) => _$PatientRegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PatientRegisterResponseToJson(this);
}
