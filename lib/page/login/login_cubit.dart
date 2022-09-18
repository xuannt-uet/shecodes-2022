import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shecodes2022/config/appplication.dart';
import 'package:shecodes2022/main.dart';
import 'package:shecodes2022/repository/user_repository.dart';
import 'package:shecodes2022/service/param_model/login_params/login_params.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  var fbKey = GlobalKey<FormBuilderState>();
  final _userRepository = getIt<UserRepository>();

  Future<void> login() async {
    final data = fbKey.currentState!.value;
    final loginParam = LoginParams(email: data['email'], password: data['password']);
    try {
      emit(LoginLoading());
      final user = await _userRepository.login(loginParam);
      Application.sharePreference
        ..putString("userName", "${user?.name}")
        ..putString("userEmail", "${user?.email}");
      emit(LoginSuccess());
    } on Exception catch (e) {
      emit(LoginFailed('Login failed'));
    }
  }
}
