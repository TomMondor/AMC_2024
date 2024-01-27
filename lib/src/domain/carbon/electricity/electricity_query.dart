import 'package:json_annotation/json_annotation.dart';

part 'electricity_query.g.dart';

@JsonSerializable()
class ElectricityQuery {
  @JsonKey(defaultValue: 'electricity')
  String type;

  @JsonKey(defaultValue: 'ca')
  String country;

  @JsonKey(defaultValue: 'qc')
  String state;

  @JsonKey(name: 'electricity_unit')
  String electricityUnit;

  @JsonKey(name: 'electricity_value')
  double electricityValue;

  ElectricityQuery({
    required this.electricityUnit,
    required this.electricityValue,
  })  : type = 'electricity',
        country = 'ca',
        state = 'qc';

  factory ElectricityQuery.fromJson(Map<String, dynamic> json) =>
      _$ElectricityQueryFromJson(json);

  Map<String, dynamic> toJson() => _$ElectricityQueryToJson(this);
}
