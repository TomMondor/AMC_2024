// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electricity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectricityModel _$ElectricityModelFromJson(Map<String, dynamic> json) =>
    ElectricityModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElectricityModelToJson(ElectricityModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      type: json['type'] as String,
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      country: json['country'] as String,
      state: json['state'] as String,
      electricityUnit: json['electricity_unit'] as String,
      electricityValue: (json['electricity_value'] as num).toDouble(),
      estimatedAt: json['estimated_at'] as String,
      carbonG: json['carbon_g'] as int,
      carbonLb: (json['carbon_lb'] as num).toDouble(),
      carbonKg: (json['carbon_kg'] as num).toDouble(),
      carbonMt: (json['carbon_mt'] as num).toDouble(),
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'country': instance.country,
      'state': instance.state,
      'electricity_unit': instance.electricityUnit,
      'electricity_value': instance.electricityValue,
      'estimated_at': instance.estimatedAt,
      'carbon_g': instance.carbonG,
      'carbon_lb': instance.carbonLb,
      'carbon_kg': instance.carbonKg,
      'carbon_mt': instance.carbonMt,
    };
