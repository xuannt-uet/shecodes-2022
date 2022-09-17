import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  var fbKey = GlobalKey<FormBuilderState>();

  Future<void> register() async {
    var data = fbKey.currentState!.value;
    try {
      emit(RegisterLoading());
      // var response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: data["user_name"], password: data["password"]);
      // var user = response.user!;
      // await _authService.saveToken(UserToken.fromUserFireBase(user));
      Future.delayed(const Duration(seconds: 2));
      emit(RegisterSuccess());
    } on Exception catch (e) {
      debugPrint(e.runtimeType.toString());
      emit(RegisterFailed('Register failed'));
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
