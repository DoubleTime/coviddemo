import 'package:dio/dio.dart';

class ApiClient {
  static ApiClient _instance = ApiClient._();
  factory ApiClient() => _instance;

  final Dio dio = Dio(BaseOptions(headers: {
    'Content-Type': 'application/json',
    'x-rapidapi-key': '2108f77268msh2b2e6c0ce59216ap1cb97djsnc429619cc545'
  }));

  ApiClient._() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, _) async {
      print(
          'Call: ${options.method} ${options.baseUrl}${options.path} ${options.queryParameters}');
      print('Data: ${options.data}');

      _.next(options);
    }, onResponse: (Response response, _) async {
      print('Result: ${response.data}');
      _.next(response);
    }, onError: (DioError e, _) async {
      print('Error: ${e.response?.data ?? e.error}');
      _.next(e);
    }));
  }
}
