import 'package:json_annotation/json_annotation.dart';
import 'package:shecodes2022/model/patient/patient.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  String? name;
  String? phoneNumber;
  DateTime? dateOfBirth;
  String? address;
  String? description;
  String? avatar;
  double? rating;
  List<ServiceModel>? serviceModel;

  Doctor({
    this.name,
    this.phoneNumber,
    this.dateOfBirth,
    this.address,
    this.description,
    this.avatar,
    this.rating,
    this.serviceModel,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class ServiceModel {
  String? name;
  double? price;
  double? rating;

  ServiceModel({this.name, this.price, this.rating});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}

@JsonSerializable()
class Comment {
  String? note;
  Patient? patient;

  Comment({this.note, this.patient});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class TimeSlot {
  DateTime? value;
  List<DateTime>? freeTime;

  TimeSlot({this.value, this.freeTime});

  factory TimeSlot.fromJson(Map<String, dynamic> json) => _$TimeSlotFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotToJson(this);
}
