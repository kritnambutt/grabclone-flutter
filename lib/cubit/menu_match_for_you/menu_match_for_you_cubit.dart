import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabclone/cubit/menu_match_for_you/menu_match_for_you_state.dart';
import 'package:grabclone/services/food_service.dart';

class MenuMatchForYouCubit extends Cubit<MenuMatchForYouState> {
  MenuMatchForYouCubit() : super(InitMenuMatchForYou()) {}

  final FoodService foodService = FoodService();

  Future<void> getMenuMathForYou() async {
    try {
      // turn into loading state
      emit(LoadingMenuMatchForYou());

      // fetch data && emit loaded success
      final result = await foodService.getMenuMatchForYou();
      emit(LoadedSuccessMenuMatchForYou(result));
    } catch (e) {
      print("error call get menu match for you: " + e.toString());
      // emit loaded error
      emit(ErrorMenuMatchForYou(e.toString()));
    }
  }
}
