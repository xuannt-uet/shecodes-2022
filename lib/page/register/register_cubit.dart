import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shecodes2022/config/appplication.dart';
import 'package:shecodes2022/main.dart';
import 'package:shecodes2022/repository/user_repository.dart';
import 'package:shecodes2022/service/param_model/register_params/register_params.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  var fbKey = GlobalKey<FormBuilderState>();
  final _userRepository = getIt<UserRepository>();

  Future<void> register() async {
    var data = fbKey.currentState!.value;
    final registerParams = RegisterParams(
      email: data['email'],
      name: data['name'],
      password: data['password'],
      dateOfBirth: data['dateOfBirth'],
      phoneNumber: data['phoneNumber'],
    );
    try {
      emit(RegisterLoading());
      final user = await _userRepository.register(registerParams);
      Application.sharePreference.putString("userName", "${user?.name}");
      emit(RegisterSuccess());
    } on Exception catch (e) {
      debugPrint(e.runtimeType.toString());
      emit(RegisterFailed('Register failed'));
    }
  }
}
