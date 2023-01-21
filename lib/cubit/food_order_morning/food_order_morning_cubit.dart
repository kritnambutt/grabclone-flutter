import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabclone/cubit/food_order_morning/food_order_morning_state.dart';
import 'package:grabclone/services/food_service.dart';

class FoodOrderMorningCubit extends Cubit<FoodOrderMorningState> {
  FoodOrderMorningCubit() : super(InitFoodOrderMorning()) {}

  final FoodService foodService = FoodService();

  Future<void> getFoodOrderMorning() async {
    try {
      // turn into loading state
      emit(LoadingFoodOrderMorning());

      // fetch data && emit loaded success
      final result = await foodService.getFoodOrderMorning();
      emit(LoadedSuccessFoodOrderMorning(result));
    } catch (e) {
      // emit loaded error
      emit(ErrorFoodOrderMorning(e.toString()));
    }
  }
}
