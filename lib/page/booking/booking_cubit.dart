import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shecodes2022/model/doctor/doctor.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  var servicesSelected = <ServiceModel>[
    ServiceModel(name: 'Nho rang khon', price: 120000, rating: 4.8),
    ServiceModel(name: 'Nho rang khon', price: 233000, rating: 3),
  ];
  late DateTime timeSlotSelected;
  Future<void> bookAppointment() async {
    try {
      emit(BookingLoading());
      // var response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: data["user_name"], password: data["password"]);
      // var user = response.user!;
      // await _authService.saveToken(UserToken.fromUserFireBase(user));
      Future.delayed(const Duration(seconds: 2));
      emit(BookingSuccess());
    } on Exception catch (e) {
      debugPrint(e.runtimeType.toString());
      emit(BookingFailed('Booking failed'));
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
