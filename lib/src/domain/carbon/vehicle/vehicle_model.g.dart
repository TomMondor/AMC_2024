// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
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
      distanceValue: (json['distance_value'] as num).toDouble(),
      vehicleMake: json['vehicle_make'] as String,
      vehicleModel: json['vehicle_model'] as String,
      vehicleYear: json['vehicle_year'] as int,
      vehicleModelId: json['vehicle_model_id'] as String,
      distanceUnit: json['distance_unit'] as String,
      estimatedAt: json['estimated_at'] as String,
      carbonG: json['carbon_g'] as int,
      carbonLb: (json['carbon_lb'] as num).toDouble(),
      carbonKg: (json['carbon_kg'] as num).toDouble(),
      carbonMt: (json['carbon_mt'] as num).toDouble(),
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'distance_value': instance.distanceValue,
      'vehicle_make': instance.vehicleMake,
      'vehicle_model': instance.vehicleModel,
      'vehicle_year': instance.vehicleYear,
      'vehicle_model_id': instance.vehicleModelId,
      'distance_unit': instance.distanceUnit,
      'estimated_at': instance.estimatedAt,
      'carbon_g': instance.carbonG,
      'carbon_lb': instance.carbonLb,
      'carbon_kg': instance.carbonKg,
      'carbon_mt': instance.carbonMt,
    };
