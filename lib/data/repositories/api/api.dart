import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'User-Agent': 'Mozilla/5.0', // 🔥 VERY IMPORTANT
      },
    ),
  );

  API() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }

  Dio get sendRequest => _dio;
}