import 'package:equatable/equatable.dart';
import 'package:grabclone/models/Food.dart';

abstract class MenuMatchForYouState extends Equatable {}

class InitMenuMatchForYou extends MenuMatchForYouState {
  @override
  List<Object> get props => [];
}

class LoadingMenuMatchForYou extends MenuMatchForYouState {
  @override
  List<Object> get props => [];
}

class LoadedSuccessMenuMatchForYou extends MenuMatchForYouState {
  final List<MenuFoodShop> listData;

  LoadedSuccessMenuMatchForYou(this.listData);

  @override
  List<Object> get props => [listData];
}

class ErrorMenuMatchForYou extends MenuMatchForYouState {
  final String message;

  ErrorMenuMatchForYou(this.message);

  @override
  List<Object> get props => [message];
}
