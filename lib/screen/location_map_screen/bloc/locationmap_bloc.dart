import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intershiptasks/data/models/location_model.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:meta/meta.dart';

part 'locationmap_event.dart';
part 'locationmap_state.dart';

class LocationmapBloc extends Bloc<LocationmapEvent, LocationmapState> {
  LocationmapBloc() : super(LocationmapInitial());
  List<Marker> allMarker = [];

  late double latitude = 0, lontitude = 0;

  @override
  Stream<LocationmapState> mapEventToState(
    LocationmapEvent event,
  ) async* {
    if (event is LocationmapInitialEvent) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        lontitude = position.longitude;
        allMarker.add(Marker(
            markerId: MarkerId("My Marker"),
            draggable: false,
            onTap: () {
              print(StringResource.Position +
                  " = " +
                  position.latitude.toString() +
                  " , " +
                  position.longitude.toString());
            },
            position: LatLng(position.latitude, position.longitude)));
        allMarker.add(Marker(
            markerId: MarkerId("My Marker"),
            draggable: false,
            onTap: () {
              print(StringResource.Position +
                  " = " +
                  (position.latitude + 0.005).toString() +
                  " , " +
                  (position.longitude - 0.005).toString());
            },
            position:
                LatLng(position.latitude + 0.005, position.longitude - 0.005)));
        allMarker.add(Marker(
            markerId: MarkerId("My Marker"),
            draggable: false,
            onTap: () {
              print(StringResource.Position +
                  " = " +
                  (position.latitude - 0.005).toString() +
                  " , " +
                  (position.longitude + 0.005).toString());
            },
            position:
                LatLng(position.latitude - 0.005, position.longitude + 0.005)));
        allMarker.add(Marker(
            markerId: MarkerId("My Marker"),
            draggable: false,
            onTap: () {
              print(StringResource.Position +
                  " = " +
                  (position.latitude - 0.005).toString() +
                  " , " +
                  (position.longitude - 0.005).toString());
            },
            position:
                LatLng(position.latitude - 0.005, position.longitude - 0.005)));

        allMarker.add(Marker(
            markerId: MarkerId("My Marker"),
            draggable: false,
            onTap: () {
              print(StringResource.Position +
                  " = " +
                  (position.latitude + 0.005).toString() +
                  " , " +
                  (position.longitude + 0.005).toString());
            },
            position:
                LatLng(position.latitude + 0.005, position.longitude + 0.005)));
      } catch (e) {
        print(e);
      }
      yield LocationmapLoadedState();
    }
  }
}
