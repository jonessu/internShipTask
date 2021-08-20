import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/data/movie_data.dart';
import 'package:intershiptasks/screen/bottom_sheet_scree/bloc/bottomsheet_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

int screenId = 6;

class BottomsheetSCREEN extends StatefulWidget {
  BottomsheetSCREEN({Key? key}) : super(key: key);

  @override
  _BottomsheetSCREENState createState() => _BottomsheetSCREENState();
}

class _BottomsheetSCREENState extends State<BottomsheetSCREEN> {
  late BottomsheetBloc bottomsheetBloc;
  @override
  void initState() {
    super.initState();
    bottomsheetBloc = BottomsheetBloc()..add(BottomsheetInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BottomsheetBloc, BottomsheetState>(
      bloc: bottomsheetBloc,
      listener: (context, state) {},
      child: BlocBuilder<BottomsheetBloc, BottomsheetState>(
        bloc: bottomsheetBloc,
        builder: (context, state) {
          if (state is BottomsheetLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is BottomsheetLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.BottomSheet,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: ListView(
                children: [
                  TABNAVIGATION(screenId: screenId),
                  Container(
                    height: MediaQuery.of(context).size.height - 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: ColorResource.color0066cc,
                              context: context,
                              builder: (context) => Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RaisedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) => Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                RaisedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text_Widget(
                                                    text: StringResource
                                                        .ClickToPreviousBottomSheet,
                                                    font_size:
                                                        SizeResource.size12,
                                                    colour: ColorResource
                                                        .color1c1d22,
                                                    font_family:
                                                        FontFamilyResource
                                                            .PoppinsSemiBold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text_Widget(
                                        text: StringResource
                                            .ClickToNextBottomSheet,
                                        font_size: SizeResource.size12,
                                        colour: ColorResource.color1c1d22,
                                        font_family:
                                            FontFamilyResource.PoppinsSemiBold,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    RaisedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text_Widget(
                                        text: StringResource
                                            .ClickToPreviousBottomScreen,
                                        font_size: SizeResource.size12,
                                        colour: ColorResource.color1c1d22,
                                        font_family:
                                            FontFamilyResource.PoppinsSemiBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Text_Widget(
                            text: StringResource.ClickToBottomSheet,
                            font_size: SizeResource.size12,
                            colour: ColorResource.color1c1d22,
                            font_family: FontFamilyResource.PoppinsSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Container(
            color: ColorResource.colorred,
          );
        },
      ),
    );
  }
}
