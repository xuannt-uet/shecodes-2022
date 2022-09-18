import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shecodes2022/config/appplication.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is InitStart) {
        await Future.delayed(const Duration(seconds: 2));
        try {
          var user = Application.sharePreference.getString('userName');
          if (user != null) {
            emit(Authenticated());
          } else {
            emit(NotAuthenticated());
          }
        } catch (e) {
          emit(NotAuthenticated());
        }
      }
    });
  }
}
