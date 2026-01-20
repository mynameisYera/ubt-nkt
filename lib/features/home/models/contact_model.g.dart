// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactModel _$ContactModelFromJson(Map<String, dynamic> json) =>
    _ContactModel(
      phone: json['phone'] as String,
      whatsappUrl: json['whatsapp_url'] as String,
    );

Map<String, dynamic> _$ContactModelToJson(_ContactModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'whatsapp_url': instance.whatsappUrl,
    };
