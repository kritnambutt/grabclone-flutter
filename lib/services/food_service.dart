import 'package:dio/dio.dart';
import 'package:grabclone/dio/dio_helper.dart';
import 'package:grabclone/models/Food.dart';
import 'package:grabclone/models/Shop.dart';

class FoodService {
  final dioInstance = DioHelper();

  Future<dynamic> getLastFoodOrder() async {
    final url = '/shop_food/last-order-food';

    Response res = await dioInstance.get(url);
    List<dynamic> responseJson = res.data;
    var result = responseJson.map((m) => new ShopFood.fromJson(m)).toList();

    return result;
  }

  Future<dynamic> getFoodShopMayLike() async {
    final url = '/shop_food/foodshop-may-like';

    Response res = await dioInstance.get(url);
    List<dynamic> responseJson = res.data;
    var result = responseJson.map((m) => new ShopFood.fromJson(m)).toList();

    return result;
  }

  Future<dynamic> getFoodOrderMorning() async {
    final url = '/shop_food/food-order-morning';

    Response res = await dioInstance.get(url);
    List<dynamic> responseJson = res.data;
    var result = responseJson.map((m) => new ShopFood.fromJson(m)).toList();

    return result;
  }

  Future<dynamic> getMenuMatchForYou() async {
    final url = '/food_menu/match-for-you';

    Response res = await dioInstance.get(url);
    List<dynamic> responseJson = res.data;
    var result = responseJson.map((m) => new MenuFoodShop.fromJson(m)).toList();

    return result;
  }
}
