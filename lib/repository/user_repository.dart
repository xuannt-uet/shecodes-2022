import 'package:shecodes2022/model/patient/patient.dart';
import 'package:shecodes2022/service/param_model/login_params/login_params.dart';
import 'package:shecodes2022/service/param_model/register_params/register_params.dart';
import 'package:shecodes2022/service/user_service/user_service.dart';

class UserRepository {
  UserRepository({required this.userService});

  final UserService userService;

  Future<Patient?> login(LoginParams loginParams) async {
    final result = await userService.login(loginParams);
    return result.user;
  }

  Future<Patient?> register(RegisterParams registerParams) async {
    final result = await userService.register(registerParams);
    return result.result;
  }
}
