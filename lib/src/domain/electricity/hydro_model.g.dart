// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HydroModel _$HydroModelFromJson(Map<String, dynamic> json) => HydroModel(
      dateStart: json['dateStart'] as String,
      dateEnd: json['dateEnd'] as String,
      recentHour: json['recentHour'] as String,
      indexDonneePlusRecent: json['indexDonneePlusRecent'] as int,
      nbDateAvecData: json['nbDateAvecData'] as int,
      details: (json['details'] as List<dynamic>)
          .map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HydroModelToJson(HydroModel instance) =>
    <String, dynamic>{
      'dateStart': instance.dateStart,
      'dateEnd': instance.dateEnd,
      'recentHour': instance.recentHour,
      'indexDonneePlusRecent': instance.indexDonneePlusRecent,
      'nbDateAvecData': instance.nbDateAvecData,
      'details': instance.details,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      date: json['date'] as String,
      values: Valeurs.fromJson(json['valeurs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'date': instance.date,
      'valeurs': instance.values,
    };

Valeurs _$ValeursFromJson(Map<String, dynamic> json) => Valeurs(
      demandeTotal: (json['demandeTotal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ValeursToJson(Valeurs instance) => <String, dynamic>{
      'demandeTotal': instance.demandeTotal,
    };
