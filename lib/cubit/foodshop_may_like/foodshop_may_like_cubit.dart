import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabclone/api/api_provider.dart';
import 'package:grabclone/cubit/foodshop_may_like/foodshop_may_like_state.dart';
import 'package:grabclone/models/Shop.dart';

class FoodShopMayLikeCubit extends Cubit<FoodShopMayLikeState> {
  FoodShopMayLikeCubit() : super(InitFoodShopMayLike()) {}

  final ApiProvider apiProvider = ApiProvider();

  Future<void> getFoodShopMayLike() async {
    try {
      // turn into loading state
      emit(LoadingFoodShopMayLike());

      // fetch data
      final Response res = await apiProvider.getFoodShopMayLike();
      List<dynamic> responseJson = res.data;
      var result = responseJson.map((m) => new ShopFood.fromJson(m)).toList();

      // emit loaded success
      emit(LoadedSuccessFoodShopMayLike(result));
    } catch (e) {
      print("call get last order food: " + e.toString());
      // emit loaded error
      emit(ErrorFoodShopMayLike(e.toString()));
    }
  }
}
