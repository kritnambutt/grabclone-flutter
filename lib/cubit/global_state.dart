import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grabclone/models/Shop.dart';

class GlobalState extends Equatable {
  final Position? currentUserPosition;
  final String? currentAddress;
  final List<ShopFood>? listLastOrderFood;

  const GlobalState(
      {this.currentUserPosition, this.currentAddress, this.listLastOrderFood});

  GlobalState copyWith({
    Position? currentUserPosition,
    String? currentAddress,
    List<ShopFood>? listLastOrderFood,
  }) {
    return GlobalState(
      currentUserPosition: currentUserPosition ?? this.currentUserPosition,
      currentAddress: currentAddress ?? this.currentAddress,
      listLastOrderFood: listLastOrderFood ?? this.listLastOrderFood,
    );
  }

  @override
  List<Object?> get props =>
      [currentUserPosition, currentAddress, listLastOrderFood];
}
