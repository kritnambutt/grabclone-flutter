import 'package:equatable/equatable.dart';
import 'package:grabclone/models/Shop.dart';

abstract class FoodShopMayLikeState extends Equatable {}

class InitFoodShopMayLike extends FoodShopMayLikeState {
  @override
  List<Object> get props => [];
}

class LoadingFoodShopMayLike extends FoodShopMayLikeState {
  @override
  List<Object> get props => [];
}

class LoadedSuccessFoodShopMayLike extends FoodShopMayLikeState {
  final List<ShopFood> listData;

  LoadedSuccessFoodShopMayLike(this.listData);

  @override
  List<Object> get props => [listData];
}

class ErrorFoodShopMayLike extends FoodShopMayLikeState {
  final String message;

  ErrorFoodShopMayLike(this.message);

  @override
  List<Object> get props => [message];
}
