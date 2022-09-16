import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  var fbKey = GlobalKey<FormBuilderState>();

  Future<void> login() async {
    var data = fbKey.currentState!.value;
    try {
      emit(LoginLoading());
      // var response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: data["user_name"], password: data["password"]);
      // var user = response.user!;
      // await _authService.saveToken(UserToken.fromUserFireBase(user));
      Future.delayed(const Duration(seconds: 2));
      emit(LoginSuccess());
    } on Exception catch (e) {
      debugPrint(e.runtimeType.toString());
      emit(LoginFailed('Login failed'));
      // switch (e.code) {
      //   case 'invalid-email':
      //     emit(LoginFailed(S.current.invalid_email));
      //     break;
      //   case 'user-disabled':
      //     emit(LoginFailed(S.current.disabled_account));
      //     break;
      //   case 'wrong-password':
      //     emit(LoginFailed(S.current.wrong_password));
      //     break;
      //   default:
      //     emit(LoginFailed(S.current.no_account));
      //     break;
      // }
      // logger.e(e.toString());
    }
  }
}
