import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shecodes2022/model/doctor/doctor.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getDoctors();
  }

  final doctors = [];
  final img =
      'https://img.freepik.com/premium-photo/funny-asian-woman-doctor-looks-through-magnifying-glass-patient-wears-medical-face-mask-rubber-gloves-white-background_1258-83743.jpg?w=2000';

  Future<void> searchDoctor(String key) async {
    try {
      emit(HomeLoading());
      Future.delayed(const Duration(seconds: 2));
      emit(HomeLoaded());
    } on Exception catch (e) {
      debugPrint(e.runtimeType.toString());
      emit(HomeLoadFailed());
    }
  }

  Future<void> getDoctors() async {
    try {
      emit(HomeLoading());
      doctors.addAll([
        Doctor(
          name: 'Doctor Nam',
          rating: 4.5,
          phoneNumber: '08826362',
          dateOfBirth: DateTime(1997, 08, 15),
          address: 'so 1 duong NDC',
          description: 'ABC good doctor chua benh khong can nhin',
          avatar: 'https://vfdc.com.vn/wp-content/uploads/2020/12/wysiwyg-uploads_1569586526901-doctor.jpg',
          serviceModel: [ServiceModel(name: 'Nho rang khon', price: 120.000)],
        ),
        Doctor(
          name: 'Doctor My',
          phoneNumber: '08826362',
          rating: 3.5,
          dateOfBirth: DateTime(1997, 08, 15),
          address: 'so 1 duong NDC',
          description: 'ABC doctor provjp benh gi cung chua duoc',
          avatar: 'https://vfdc.com.vn/wp-content/uploads/2020/12/wysiwyg-uploads_1569586526901-doctor.jpg',
          serviceModel: [ServiceModel(name: 'Nho rang sua', price: 100000)],
        ),
        Doctor(
          name: 'Doctor Ha Anh',
          rating: 5.0,
          phoneNumber: '08826362',
          dateOfBirth: DateTime(1997, 08, 15),
          address: 'so 1 duong NDC',
          description: 'ABC good doctor, good boy, con trai cua me chua benh bang tay',
          avatar: 'https://vfdc.com.vn/wp-content/uploads/2020/12/wysiwyg-uploads_1569586526901-doctor.jpg',
          serviceModel: [ServiceModel(name: 'Lam rang su', price: 1020000)],
        ),
        Doctor(
          name: 'Doctor Tuan',
          phoneNumber: '08826362',
          rating: 4.8,
          dateOfBirth: DateTime(1997, 08, 15),
          address: 'so 1 duong NDC',
          description: 'ABC doctor provjp benh nao cung chua duoc nao cung chua duoc',
          avatar: 'https://vfdc.com.vn/wp-content/uploads/2020/12/wysiwyg-uploads_1569586526901-doctor.jpg',
          serviceModel: [ServiceModel(name: 'Lam rang nhua', price: 1020000)],
        ),
        Doctor(
          name: 'Doctor Tuan',
          phoneNumber: '08826362',
          rating: 4.8,
          dateOfBirth: DateTime(1997, 08, 15),
          address: 'so 1 duong NDC',
          description: 'ABC doctor provjp benh nao cung chua duoc nao cung chua duoc',
          avatar: 'https://vfdc.com.vn/wp-content/uploads/2020/12/wysiwyg-uploads_1569586526901-doctor.jpg',
          serviceModel: [ServiceModel(name: 'Nieng rang', price: 1020000)],
        ),
      ]);
      Future.delayed(const Duration(seconds: 2));
      emit(HomeLoaded());
    } on Exception catch (e) {
      debugPrint(e.runtimeType.toString());
      emit(HomeLoadFailed());
    }
  }
}
