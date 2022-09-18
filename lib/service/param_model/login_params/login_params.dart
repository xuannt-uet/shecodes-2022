import 'package:json_annotation/json_annotation.dart';
part 'login_params.g.dart';
@JsonSerializable()
class LoginParams {
  const LoginParams({required this.email, required this.password});

  final String email;
  final String password;

  factory LoginParams.fromJson(Map<String, dynamic> json) => _$LoginParamsFromJson(json);
  Map<String, dynamic> toJson() => _$LoginParamsToJson(this);

}