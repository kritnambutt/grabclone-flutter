import 'package:equatable/equatable.dart';
import 'package:grabclone/models/Shop.dart';

abstract class FoodOrderMorningState extends Equatable {}

class InitFoodOrderMorning extends FoodOrderMorningState {
  @override
  List<Object> get props => [];
}

class LoadingFoodOrderMorning extends FoodOrderMorningState {
  @override
  List<Object> get props => [];
}

class LoadedSuccessFoodOrderMorning extends FoodOrderMorningState {
  final List<ShopFood> listData;

  LoadedSuccessFoodOrderMorning(this.listData);

  @override
  List<Object> get props => [listData];
}

class ErrorFoodOrderMorning extends FoodOrderMorningState {
  final String message;

  ErrorFoodOrderMorning(this.message);

  @override
  List<Object> get props => [message];
}
