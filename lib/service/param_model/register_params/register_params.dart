import 'package:json_annotation/json_annotation.dart';

part 'register_params.g.dart';

@JsonSerializable()
class RegisterParams {
   RegisterParams({
    required this.email,
    required this.name,
    required this.password,
    required this.dateOfBirth,
    required this.phoneNumber,
  });

  final String email;
  final String name;
  final String phoneNumber;
  DateTime dateOfBirth;
  String password;

  factory RegisterParams.fromJson(Map<String, dynamic> json) => _$RegisterParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);
}
