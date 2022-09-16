import 'package:shecodes2022/constant/api_endpoint.dart';
import 'package:shecodes2022/model/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio) = _UserService;

  @POST(ApiEndpoint.login)
  Future<List<User>> login(@Body() CreateUserParams createUserParams);
}

@JsonSerializable()
class CreateUserParams {
  const CreateUserParams({required this.job, required this.name});

  final String name;
  final String job;

  factory CreateUserParams.fromJson(Map<String, dynamic> json) => _$CreateUserParamsFromJson(json);
}