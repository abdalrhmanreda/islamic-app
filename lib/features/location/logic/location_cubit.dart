import 'dart:async';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/methods/get_current_location/get_current_location.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState.initial());

  Position? position;
  String address = '';

  final _qiblaDirectionController = StreamController<double>.broadcast();

  Stream<double> get qiblaDirectionStream => _qiblaDirectionController.stream;

  void getLocation({bool? isQibla}) async {
    emit(const LocationState.loading());
    try {
      position = await GetCurrentLocation().getCurrentPosition();
      if (isQibla == true) {
        final qiblaDirection = await getQiblaDirection();
        _qiblaDirectionController.add(qiblaDirection);
      } else {
        print('not qibla');
      }
      address = await GetCurrentLocation().getAddressFromCoordinates(
          position!.latitude, position!.longitude, 'ar');
      emit(LocationState.success(position));
    } catch (e) {
      emit(LocationState.error(e.toString()));
    }
  }

  Future<double> getQiblaDirection() async {
    var coordinates = Coordinates(position!.latitude, position!.longitude);
    double qiblaDirection = Qibla.qibla(coordinates);
    print(qiblaDirection);
    return qiblaDirection;
  }

  @override
  Future<void> close() {
    _qiblaDirectionController.close();
    return super.close();
  }
}
