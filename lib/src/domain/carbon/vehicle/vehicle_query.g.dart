// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleQuery _$VehicleQueryFromJson(Map<String, dynamic> json) => VehicleQuery(
      distanceValue: (json['distance_value'] as num).toDouble(),
      vehicleModelId: json['vehicle_model_id'] as String,
    )
      ..type = json['type'] as String? ?? 'vehicle'
      ..distanceUnit = json['distance_unit'] as String? ?? 'km';

Map<String, dynamic> _$VehicleQueryToJson(VehicleQuery instance) =>
    <String, dynamic>{
      'type': instance.type,
      'distance_unit': instance.distanceUnit,
      'distance_value': instance.distanceValue,
      'vehicle_model_id': instance.vehicleModelId,
    };
