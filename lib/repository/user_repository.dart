
import 'package:shecodes2022/model/user.dart';
import 'package:shecodes2022/service/user_service/user_service.dart';

class UserRepository {
  UserRepository({required this.userService});

  final UserService userService;

  Future<List<User>> login(CreateUserParams createUserParams) {
    return userService.login(createUserParams);
  }
}
