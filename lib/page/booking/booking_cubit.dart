import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shecodes2022/model/doctor/doctor.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());
  final services = [
    ServiceModel(name: 'Nho rang khon', price: 200000, rating: 4),
    ServiceModel(name: 'Nho rang khon', price: 200000, rating: 5),
    ServiceModel(name: 'Nho rang khon', price: 120000, rating: 4.8),
    ServiceModel(name: 'Nho rang khon', price: 233000, rating: 3),
  ];
  var listSelect = List.filled(4, false);
  final timeSlot = TimeSlot(
    value: DateTime.now(),
    freeTime: [
      DateTime.parse('2022-09-18 08:15:04Z'),
      DateTime.parse('2022-09-18 09:15:04Z'),
      DateTime.parse('2022-09-18 09:45:04Z'),
      DateTime.parse('2022-09-18 10:30:04Z'),
      DateTime.parse('2022-09-18 10:55:04Z'),
      DateTime.parse('2022-09-18 11:00:04Z'),
      DateTime.parse('2022-09-18 11:15:04Z'),
      DateTime.parse('2022-09-18 12:00:04Z'),
    ],
  );
  var listTapped = List.filled(8, false);
  Future<void> bookAppointment() async {
    try {
      emit(BookingLoading());
      Future.delayed(const Duration(seconds: 2));
      emit(BookingSuccess());
    } on Exception catch (e) {
      debugPrint(e.runtimeType.toString());
      emit(BookingFailed('Booking failed'));
    }
  }
}
