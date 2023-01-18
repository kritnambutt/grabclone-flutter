import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabclone/api/api_provider.dart';
import 'package:grabclone/models/Shop.dart';

import 'last_order_food_state.dart';

class LastOrderFoodCubit extends Cubit<LastOrderFoodState> {
  LastOrderFoodCubit() : super(InitLastOrderFood()) {}

  final ApiProvider apiProvider = ApiProvider();

  Future<void> getLastOrderFood() async {
    try {
      // turn into loading state
      emit(LoadingLastOrderFood());

      // fetch data
      final Response res = await apiProvider.getLastFoodOrder();
      List<dynamic> responseJson = res.data;
      var result = responseJson.map((m) => new ShopFood.fromJson(m)).toList();

      // emit loaded success
      emit(LoadedSuccessLastOrderFood(result));
    } catch (e) {
      // emit loaded error
      emit(ErrorLastOrderFood(e.toString()));
    }
  }
}
