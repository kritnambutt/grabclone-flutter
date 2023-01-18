import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabclone/api/api_provider.dart';
import 'package:grabclone/cubit/menu_match_for_you/menu_match_for_you_state.dart';
import 'package:grabclone/models/Food.dart';

class MenuMatchForYouCubit extends Cubit<MenuMatchForYouState> {
  MenuMatchForYouCubit() : super(InitMenuMatchForYou()) {}

  final ApiProvider apiProvider = ApiProvider();

  Future<void> getMenuMathForYou() async {
    try {
      // turn into loading state
      emit(LoadingMenuMatchForYou());

      // fetch data
      final Response res = await apiProvider.getMenuMatchForYou();
      List<dynamic> responseJson = res.data;
      var result =
          responseJson.map((m) => new MenuFoodShop.fromJson(m)).toList();

      // emit loaded success
      emit(LoadedSuccessMenuMatchForYou(result));
    } catch (e) {
      print("error call get menu match for you: " + e.toString());
      // emit loaded error
      emit(ErrorMenuMatchForYou(e.toString()));
    }
  }
}
