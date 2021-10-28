import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statistic_response.g.dart';

@JsonSerializable()
class StatisticResponse {
  List<Statistic> response;

  StatisticResponse({required this.response});

  factory StatisticResponse.fromJson(Map<String, dynamic> json) =>
      _$StatisticResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StatisticResponseToJson(this);
}

@JsonSerializable()
class Statistic {
  String? continent;
  int population;
  Cases? cases;

  Statistic(this.continent, this.population, this.cases);

  factory Statistic.fromJson(Map<String, dynamic> json) =>
      _$StatisticFromJson(json);
  Map<String, dynamic> toJson() => _$StatisticToJson(this);
}

@JsonSerializable()
class Cases {
  @JsonKey(name: 'new')
  String? newCase;
  num? active;
  num? critical;
  Cases(this.newCase, this.active, this.critical);

  factory Cases.fromJson(Map<String, dynamic> json) => _$CasesFromJson(json);
  Map<String, dynamic> toJson() => _$CasesToJson(this);
}
