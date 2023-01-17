import 'package:equatable/equatable.dart';
import 'package:grabclone/models/Shop.dart';

abstract class LastOrderFoodState extends Equatable {}

class InitLastOrderFood extends LastOrderFoodState {
  @override
  List<Object> get props => [];
}

class LoadingLastOrderFood extends LastOrderFoodState {
  @override
  List<Object> get props => [];
}

class LoadedSuccessLastOrderFood extends LastOrderFoodState {
  final List<ShopFood> listData;

  LoadedSuccessLastOrderFood(this.listData);

  @override
  List<Object> get props => [listData];
}

class ErrorLastOrderFood extends LastOrderFoodState {
  final String message;

  ErrorLastOrderFood(this.message);

  @override
  List<Object> get props => [message];
}
