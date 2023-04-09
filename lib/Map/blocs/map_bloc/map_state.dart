part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object?> get props => [];
}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final Address location;
  MapLoaded(this.location);

  @override
  List<Object?> get props => [location];
}

class MapError extends MapState {
  @override
  List<Object?> get props => [];
}

class MapNoInternet extends MapState {
  @override
  List<Object?> get props => [];
}

class MapCurrentLocation extends MapState {
  final Position? curentLocation;
  MapCurrentLocation(this.curentLocation);

  @override
  List<Object?> get props => [curentLocation];
}

class MapServiceDisabled extends MapState {
  final bool forceUpdate;
  MapServiceDisabled(this.forceUpdate);
  @override
  List<Object?> get props => [forceUpdate];
}