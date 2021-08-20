part of 'locationmap_bloc.dart';

@immutable
abstract class LocationmapState {}

class LocationmapInitial extends LocationmapState {}

class LocationmapLoadedState extends LocationmapState {}

class LocationmapLoadingState extends LocationmapState {}

class LocationmapFailureState extends LocationmapState {}
