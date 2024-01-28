import 'package:json_annotation/json_annotation.dart';

part 'vehicle_query.g.dart';

@JsonSerializable()
class VehicleQuery {
  @JsonKey(defaultValue: 'vehicle')
  String type;

  @JsonKey(name: 'distance_unit', defaultValue: 'km')
  String distanceUnit;

  @JsonKey(name: 'distance_value')
  double distanceValue;

  @JsonKey(name: 'vehicle_model_id')
  String vehicleModelId;

  VehicleQuery({
    required this.distanceValue,
    required this.vehicleModelId,
  })  : type = 'vehicle',
        distanceUnit = 'km';

  factory VehicleQuery.fromJson(Map<String, dynamic> json) =>
      _$VehicleQueryFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleQueryToJson(this);
}
