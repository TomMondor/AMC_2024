import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class VehicleModel {
  Data data;

  VehicleModel({
    required this.data,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}

@JsonSerializable()
class Data {
  String id;
  String type;
  Attributes attributes;

  Data({
    required this.id,
    required this.type,
    required this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Attributes {
  @JsonKey(name: 'distance_value')
  double distanceValue;

  @JsonKey(name: 'vehicle_make')
  String vehicleMake;

  @JsonKey(name: 'vehicle_model')
  String vehicleModel;

  @JsonKey(name: 'vehicle_year')
  int vehicleYear;

  @JsonKey(name: 'vehicle_model_id')
  String vehicleModelId;

  @JsonKey(name: 'distance_unit')
  String distanceUnit;

  @JsonKey(name: 'estimated_at')
  String estimatedAt;

  @JsonKey(name: 'carbon_g')
  int carbonG;

  @JsonKey(name: 'carbon_lb')
  double carbonLb;

  @JsonKey(name: 'carbon_kg')
  double carbonKg;

  @JsonKey(name: 'carbon_mt')
  double carbonMt;

  Attributes({
    required this.distanceValue,
    required this.vehicleMake,
    required this.vehicleModel,
    required this.vehicleYear,
    required this.vehicleModelId,
    required this.distanceUnit,
    required this.estimatedAt,
    required this.carbonG,
    required this.carbonLb,
    required this.carbonKg,
    required this.carbonMt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}
