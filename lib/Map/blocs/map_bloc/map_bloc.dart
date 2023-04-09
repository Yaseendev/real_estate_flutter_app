import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/Map/data/models/address.dart';
import 'package:real_estate_app/Map/data/repositories/map_repo.dart';
import 'package:real_estate_app/Utils/locator.dart';
import 'package:real_estate_app/Utils/services/location_service.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final MapRepository mapRepository = MapRepository();
   bool forceUpdate = false;
    on<FetchAreaName>((event, emit) async {
      await connectivity.checkConnectivity().then(
        (connStatus) async {
          if (connStatus != ConnectivityResult.none) {
            emit(MapLoading());
            await mapRepository
                .getReversedGeoCode(event.position)
                .then((result) {
              if (result != null){
              result.location = event.position;
                emit(MapLoaded(result));}
              else
                emit(MapError());
            }).onError((error, stackTrace) {
              emit(MapError());
            });
          } else {
            emit(MapNoInternet());
          }
        },
      );
    });

    on<LoadCurrentLocation>(((event, emit) async {
      if (await checkLocationServiceEnabled())
        emit(MapCurrentLocation(await determinePosition()));
      else {
        forceUpdate = !forceUpdate;
        emit(MapServiceDisabled(forceUpdate));
      }
    }));

  }
}
