import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grabclone/services/location_service.dart';

import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(const GlobalState());

  final LocationService locationService = LocationService(); // instance

  void reset() {
    emit(const GlobalState());
  }

  Future<void> init() async {
    loadCurrentLocation();
  }

  Future<void> loadCurrentLocation() async {
    await locationService.getCurrentPosition().then((value) async {
      String address = await getAddressFromLatLng(value['position']);

      switch (value['permission']) {
        case LocationPermission.always:
        case LocationPermission.whileInUse:
          emit(state.copyWith(
              currentUserPosition: value['position'], currentAddress: address));
          break;
        default:
      }
    });
  }

  Future<String> getAddressFromLatLng(Position position) async {
    return await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      return '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
    });
  }
}
