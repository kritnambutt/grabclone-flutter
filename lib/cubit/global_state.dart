import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

class GlobalState extends Equatable {
  final Position? currentUserPosition;
  final String? currentAddress;

  const GlobalState({this.currentUserPosition, this.currentAddress});

  GlobalState copyWith({
    Position? currentUserPosition,
    String? currentAddress,
  }) {
    return GlobalState(
      currentUserPosition: currentUserPosition ?? this.currentUserPosition,
      currentAddress: currentAddress ?? this.currentAddress,
    );
  }

  @override
  List<Object?> get props => [currentUserPosition, currentAddress];
}
