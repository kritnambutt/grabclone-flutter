import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiProvider {
  ApiProvider();

  final Dio dio = Dio(BaseOptions(
    baseUrl: '${dotenv.get("HOST_URL")}/api',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {'Content-Type': 'application/json; charset=utf-8'},
  ));

  Future<Response> getLastFoodOrder() async {
    final url = '/shop_food/last-order-food';

    Response response = await dio.request(url, options: Options(method: 'GET'));
    return response;
  }

  Future<Response> getFoodShopMayLike() async {
    final url = '/shop_food/foodshop-may-like';

    Response response = await dio.request(url, options: Options(method: 'GET'));
    return response;
  }

  Future<Response> getFoodOrderMorning() async {
    final url = '/shop_food/food-order-morning';

    Response response = await dio.request(url, options: Options(method: 'GET'));
    return response;
  }

  Future<Response> getMenuMatchForYou() async {
    final url = '/food_menu/match-for-you';

    Response response = await dio.request(url, options: Options(method: 'GET'));
    return response;
  }
}
