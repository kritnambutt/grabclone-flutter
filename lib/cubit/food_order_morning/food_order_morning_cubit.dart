import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabclone/api/api_provider.dart';
import 'package:grabclone/cubit/food_order_morning/food_order_morning_state.dart';
import 'package:grabclone/models/Shop.dart';

class FoodOrderMorningCubit extends Cubit<FoodOrderMorningState> {
  FoodOrderMorningCubit() : super(InitFoodOrderMorning()) {}

  final ApiProvider apiProvider = ApiProvider();

  Future<void> getFoodOrderMorning() async {
    try {
      // turn into loading state
      emit(LoadingFoodOrderMorning());

      // fetch data
      final Response res = await apiProvider.getFoodOrderMorning();
      List<dynamic> responseJson = res.data;
      var result = responseJson.map((m) => new ShopFood.fromJson(m)).toList();

      // emit loaded success
      emit(LoadedSuccessFoodOrderMorning(result));
    } catch (e) {
      print("call get last order food: " + e.toString());
      // emit loaded error
      emit(ErrorFoodOrderMorning(e.toString()));
    }
  }
}
