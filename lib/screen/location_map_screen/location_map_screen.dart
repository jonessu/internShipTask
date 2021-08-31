import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intershiptasks/screen/location_map_screen/bloc/locationmap_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

int screenId = 10;

class LocationmapScreen extends StatefulWidget {
  LocationmapScreen({Key? key}) : super(key: key);

  @override
  _LocationmapScreenState createState() => _LocationmapScreenState();
}

class _LocationmapScreenState extends State<LocationmapScreen> {
  late LocationmapBloc locationmapBloc;

  @override
  void initState() {
    super.initState();
    locationmapBloc = LocationmapBloc()..add(LocationmapInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationmapBloc, LocationmapState>(
      bloc: locationmapBloc,
      listener: (context, state) {},
      child: BlocBuilder<LocationmapBloc, LocationmapState>(
        bloc: locationmapBloc,
        builder: (context, state) {
          if (state is LocationmapLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is LocationmapLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.LocationAccess,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    TABNAVIGATION(screenId: screenId),
                    locationmapBloc.latitude == 0 &&
                            locationmapBloc.lontitude == 0
                        ? Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorResource.color1c1d22)),
                            margin: EdgeInsets.all(SizeResource.size10),
                            height: MediaQuery.of(context).size.height - 150,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorResource.color1c1d22)),
                            margin: EdgeInsets.all(SizeResource.size10),
                            height: MediaQuery.of(context).size.height - 150,
                            width: MediaQuery.of(context).size.width,
                            child: GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(locationmapBloc.latitude,
                                      locationmapBloc.lontitude),
                                  zoom: 15),
                              markers: Set.from(locationmapBloc.allMarker),
                            ),
                          )
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
