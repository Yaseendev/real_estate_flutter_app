part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class FetchAreaName extends MapEvent {
  final LatLng position;
  FetchAreaName(this.position);

  @override
  List<Object> get props => [position];
}
class LoadCurrentLocation extends MapEvent {

  @override
  List<Object> get props => [];
}
