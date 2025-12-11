// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserLoginModel _$UserLoginModelFromJson(Map<String, dynamic> json) =>
    _UserLoginModel(
      ok: json['ok'] as bool,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      tokens: TokensModel.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserLoginModelToJson(_UserLoginModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'user': instance.user,
      'tokens': instance.tokens,
    };

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: (json['id'] as num).toInt(),
  phone: json['phone'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  role: json['role'] as String,
  school: SchoolModel.fromJson(json['school'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'role': instance.role,
      'school': instance.school,
    };

_SchoolModel _$SchoolModelFromJson(Map<String, dynamic> json) =>
    _SchoolModel(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$SchoolModelToJson(_SchoolModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_TokensModel _$TokensModelFromJson(Map<String, dynamic> json) => _TokensModel(
  access: json['access'] as String,
  refresh: json['refresh'] as String,
);

Map<String, dynamic> _$TokensModelToJson(_TokensModel instance) =>
    <String, dynamic>{'access': instance.access, 'refresh': instance.refresh};
