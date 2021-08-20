import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'locationmap_event.dart';
part 'locationmap_state.dart';

class LocationmapBloc extends Bloc<LocationmapEvent, LocationmapState> {
  LocationmapBloc() : super(LocationmapInitial());

  @override
  Stream<LocationmapState> mapEventToState(
    LocationmapEvent event,
  ) async* {
    if (event is LocationmapInitialEvent) {
      yield LocationmapLoadedState();
    }
  }
}
