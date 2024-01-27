import 'package:json_annotation/json_annotation.dart';

part 'hydro_model.g.dart';

@JsonSerializable()
class HydroModel {
  String dateStart;
  String dateEnd;
  String recentHour;
  int indexDonneePlusRecent;
  int nbDateAvecData;
  List<Detail> details;

  HydroModel({
    required this.dateStart,
    required this.dateEnd,
    required this.recentHour,
    required this.indexDonneePlusRecent,
    required this.nbDateAvecData,
    required this.details,
  });

  factory HydroModel.fromJson(Map<String, dynamic> json) =>
      _$HydroModelFromJson(json);

  Map<String, dynamic> toJson() => _$HydroModelToJson(this);
}

@JsonSerializable()
class Detail {
  String date;

  @JsonKey(name: 'valeurs')
  Valeurs values;

  Detail({
    required this.date,
    required this.values,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}

@JsonSerializable()
class Valeurs {
  double? demandeTotal;

  Valeurs({
    required this.demandeTotal,
  });

  factory Valeurs.fromJson(Map<String, dynamic> json) =>
      _$ValeursFromJson(json);

  Map<String, dynamic> toJson() => _$ValeursToJson(this);
}
