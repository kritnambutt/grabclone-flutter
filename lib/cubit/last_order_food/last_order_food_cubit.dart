import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabclone/cubit/last_order_food/last_order_food_state.dart';
import 'package:grabclone/services/food_service.dart';

class LastOrderFoodCubit extends Cubit<LastOrderFoodState> {
  LastOrderFoodCubit() : super(InitLastOrderFood()) {}

  final FoodService foodService = FoodService();

  Future<void> getLastOrderFood() async {
    try {
      // turn into loading state
      emit(LoadingLastOrderFood());

      // fetch data && emit loaded success
      final result = await foodService.getLastFoodOrder();
      emit(LoadedSuccessLastOrderFood(result));
    } catch (e) {
      // emit loaded error
      emit(ErrorLastOrderFood(e.toString()));
    }
  }
}
