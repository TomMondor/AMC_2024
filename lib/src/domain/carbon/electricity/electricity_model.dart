import 'package:json_annotation/json_annotation.dart';

part 'electricity_model.g.dart';

@JsonSerializable()
class ElectricityModel {
  Data data;

  ElectricityModel({
    required this.data,
  });

  factory ElectricityModel.fromJson(Map<String, dynamic> json) =>
      _$ElectricityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ElectricityModelToJson(this);
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
  String country;
  String state;

  @JsonKey(name: 'electricity_unit')
  String electricityUnit;

  @JsonKey(name: 'electricity_value')
  double electricityValue;

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
    required this.country,
    required this.state,
    required this.electricityUnit,
    required this.electricityValue,
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
