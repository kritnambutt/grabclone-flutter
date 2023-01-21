import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grabclone/dio/dio_interceptor.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: '${dotenv.get("HOST_URL")}/api',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {'Content-Type': 'application/json; charset=utf-8'},
  ));

  final String _baseUrl = '${dotenv.get("HOST_URL")}';

  String get baseUrl => _baseUrl;
  Dio get dio => _dio;

  Dio init() {
    _dio.interceptors.add(DioInterceptor());
    return _dio;
  }
}
