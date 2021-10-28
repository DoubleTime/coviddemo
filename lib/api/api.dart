import 'package:coviddemo/api/api_client.dart';
import 'package:coviddemo/api/models/statistic_response.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api() {
    return _instance;
  }

  static final dio = ApiClient().dio;
  static final _instance =
      _Api(dio, baseUrl: "https://covid-193.p.rapidapi.com");

  @GET("/statistics")
  Future<StatisticResponse> getStatistic(@Query('country') String country);
}
