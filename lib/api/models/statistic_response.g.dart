// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticResponse _$StatisticResponseFromJson(Map<String, dynamic> json) =>
    StatisticResponse(
      response: (json['response'] as List<dynamic>)
          .map((e) => Statistic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatisticResponseToJson(StatisticResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
    };

Statistic _$StatisticFromJson(Map<String, dynamic> json) => Statistic(
      json['continent'] as String?,
      json['population'] as int,
      json['cases'] == null
          ? null
          : Cases.fromJson(json['cases'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatisticToJson(Statistic instance) => <String, dynamic>{
      'continent': instance.continent,
      'population': instance.population,
      'cases': instance.cases,
    };

Cases _$CasesFromJson(Map<String, dynamic> json) => Cases(
      json['new'] as String?,
      json['active'] as num?,
      json['critical'] as num?,
    );

Map<String, dynamic> _$CasesToJson(Cases instance) => <String, dynamic>{
      'new': instance.newCase,
      'active': instance.active,
      'critical': instance.critical,
    };
