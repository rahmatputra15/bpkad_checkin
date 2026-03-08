import 'package:bpkad_checkin/bloc/location/location_event.dart';
import 'package:bpkad_checkin/bloc/location/location_state.dart';
import 'package:bpkad_checkin/services/location_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationService locationService;

  LocationBloc(this.locationService) : super(LocationInitial()) {
    on<GetLocationEvent>((event, emit) async {
      emit(LocationLoading());

      try {
        final position = await locationService.getCurrentLocation();

        emit(LocationLoaded(position.latitude, position.longitude));
        print(
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}',
        );
      } catch (e) {
        emit(LocationError(e.toString()));
        print('Error getting location: ${e.toString()}');
      }
    });
  }
}
