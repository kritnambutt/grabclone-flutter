import 'package:dio/dio.dart';
import 'package:grabclone/dio/dio_helper.dart';

class ApiProvider {
  final dioInstance = DioHelper();

  Future<Response> getLastFoodOrder() async {
    final url = '/shop_food/last-order-food';

    Response response = await dioInstance.get(url);
    print(response);
    return response;
  }

  Future<Response> getFoodShopMayLike() async {
    final url = '/shop_food/foodshop-may-like';

    Response response = await dioInstance.get(url);
    return response;
  }

  Future<Response> getFoodOrderMorning() async {
    final url = '/shop_food/food-order-morning';

    Response response = await dioInstance.get(url);
    return response;
  }

  Future<Response> getMenuMatchForYou() async {
    final url = '/food_menu/match-for-you';

    Response response = await dioInstance.get(url);
    return response;
  }
}
