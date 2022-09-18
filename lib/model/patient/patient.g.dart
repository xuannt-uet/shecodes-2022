// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
    };

PatientResponse _$PatientResponseFromJson(Map<String, dynamic> json) =>
    PatientResponse(
      user: json['user'] == null
          ? null
          : Patient.fromJson(json['user'] as Map<String, dynamic>),
      session: json['session'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$PatientResponseToJson(PatientResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'session': instance.session,
    };

PatientRegisterResponse _$PatientRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    PatientRegisterResponse(
      result: json['result'] == null
          ? null
          : Patient.fromJson(json['result'] as Map<String, dynamic>),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$PatientRegisterResponseToJson(
        PatientRegisterResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'success': instance.success,
    };
