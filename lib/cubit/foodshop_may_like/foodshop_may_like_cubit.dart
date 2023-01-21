import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabclone/cubit/foodshop_may_like/foodshop_may_like_state.dart';
import 'package:grabclone/services/food_service.dart';

class FoodShopMayLikeCubit extends Cubit<FoodShopMayLikeState> {
  FoodShopMayLikeCubit() : super(InitFoodShopMayLike()) {}

  final FoodService foodService = FoodService();

  Future<void> getFoodShopMayLike() async {
    try {
      // turn into loading state
      emit(LoadingFoodShopMayLike());

      // fetch data && emit loaded success
      final result = await foodService.getFoodShopMayLike();
      emit(LoadedSuccessFoodShopMayLike(result));
    } catch (e) {
      // emit loaded error
      emit(ErrorFoodShopMayLike(e.toString()));
    }
  }
}
