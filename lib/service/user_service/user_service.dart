import 'package:shecodes2022/constant/api_endpoint.dart';
import 'package:shecodes2022/model/patient/patient.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shecodes2022/service/param_model/login_params/login_params.dart';
import 'package:shecodes2022/service/param_model/register_params/register_params.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio) = _UserService;

  @POST(ApiEndpoint.login)
  Future<PatientResponse> login(@Body() LoginParams loginParams);

  @POST(ApiEndpoint.register)
  Future<PatientRegisterResponse> register(@Body() RegisterParams registerParams);
}