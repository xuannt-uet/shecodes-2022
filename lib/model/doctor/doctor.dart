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

  Doctor({
    this.name,
    this.phoneNumber,
    this.dateOfBirth,
    this.address,
    this.description,
    this.avatar,
    this.rating,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class Service {
  String? name;
  double? price;
  double? rating;

  Service({this.name, this.price, this.rating});

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}

@JsonSerializable()
class Comment {
  String? note;
  Patient? patient;

  Comment({this.note, this.patient});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
