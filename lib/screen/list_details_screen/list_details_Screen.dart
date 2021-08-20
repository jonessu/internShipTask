import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/data/movie_data.dart';
import 'package:intershiptasks/screen/list_details_screen/bloc/listdetails_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

int screenId = 3;

class LISTDETAILSSCREEN extends StatefulWidget {
  int iD;
  LISTDETAILSSCREEN({required this.iD, Key? key}) : super(key: key);

  @override
  _LISTDETAILSSCREENState createState() => _LISTDETAILSSCREENState();
}

class _LISTDETAILSSCREENState extends State<LISTDETAILSSCREEN> {
  late ListdetailsBloc listdetailsBloc;
  @override
  void initState() {
    super.initState();
    listdetailsBloc = ListdetailsBloc()..add(ListdetailsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ListdetailsBloc, ListdetailsState>(
      bloc: listdetailsBloc,
      listener: (context, state) {},
      child: BlocBuilder<ListdetailsBloc, ListdetailsState>(
        bloc: listdetailsBloc,
        builder: (context, state) {
          if (state is ListdetailsLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is ListdetailsLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.ListDetail,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: SingleChildScrollView(
                child: ListView(
                  children: [
                    TABNAVIGATION(screenId: screenId),
                    Container(
                      padding: EdgeInsets.all(SizeResource.size10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorResource.colorwhite,
                        border: Border.all(
                          color: ColorResource.colore3e3e5,
                          width: 1,
                        ),
                      ),
                      child: Image.asset(
                          movielist[widget.iD][StringResource.imgPath]),
                    ),
                    SizedBox(height: SizeResource.size30),
                    Container(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text_Widget(
                            text: StringResource.Name +
                                " : " +
                                movielist[widget.iD][StringResource.Name],
                            font_size: SizeResource.size20,
                            colour: ColorResource.color000000,
                            font_family: FontFamilyResource.PoppinsSemiBold,
                          ),
                          SizedBox(height: 20),
                          Text_Widget(
                            text: StringResource.Director +
                                " : " +
                                movielist[widget.iD][StringResource.Director],
                            font_size: SizeResource.size12,
                            colour: ColorResource.color1c1d22,
                            font_family: FontFamilyResource.PoppinsMedium,
                          ),
                          SizedBox(height: 10),
                          Text_Widget(
                            text: StringResource.MusicDirector +
                                " : " +
                                movielist[widget.iD]
                                    [StringResource.MusicDirector],
                            font_size: SizeResource.size12,
                            colour: ColorResource.color1c1d22,
                            font_family: FontFamilyResource.PoppinsMedium,
                          ),
                          SizedBox(height: 10),
                          Text_Widget(
                            text: StringResource.Production +
                                " : " +
                                movielist[widget.iD][StringResource.Production],
                            font_size: SizeResource.size12,
                            colour: ColorResource.color1c1d22,
                            font_family: FontFamilyResource.PoppinsMedium,
                          ),
                          SizedBox(height: 10),
                          Text_Widget(
                            text: StringResource.ReleaseDate +
                                " : " +
                                movielist[widget.iD]
                                    [StringResource.ReleaseDate],
                            font_size: SizeResource.size12,
                            colour: ColorResource.color1c1d22,
                            font_family: FontFamilyResource.PoppinsMedium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
