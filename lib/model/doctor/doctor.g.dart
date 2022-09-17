// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      address: json['address'] as String?,
      description: json['description'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'address': instance.address,
      'description': instance.description,
      'avatar': instance.avatar,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'rating': instance.rating,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      note: json['note'] as String?,
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'note': instance.note,
      'patient': instance.patient,
    };
