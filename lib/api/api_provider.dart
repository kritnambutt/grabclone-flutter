import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var options = BaseOptions(
  baseUrl: '${dotenv.get("HOST_URL")}/api',
  headers: {'Content-Type': 'application/json; charset=utf-8'},
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

class ApiProvider {
  ApiProvider();

  Future<Response> getLastFoodOrder() async {
    final url = '/shop_food/last-order-food';

    Response response = await dio.request(url, options: Options(method: 'GET'));
    return response;
  }
}