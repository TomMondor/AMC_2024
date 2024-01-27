// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electricity_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectricityQuery _$ElectricityQueryFromJson(Map<String, dynamic> json) =>
    ElectricityQuery(
      electricityUnit: json['electricity_unit'] as String,
      electricityValue: (json['electricity_value'] as num).toDouble(),
    )
      ..type = json['type'] as String? ?? 'electricity'
      ..country = json['country'] as String? ?? 'ca'
      ..state = json['state'] as String? ?? 'qc';

Map<String, dynamic> _$ElectricityQueryToJson(ElectricityQuery instance) =>
    <String, dynamic>{
      'type': instance.type,
      'country': instance.country,
      'state': instance.state,
      'electricity_unit': instance.electricityUnit,
      'electricity_value': instance.electricityValue,
    };
