import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/data/movie_data.dart';
import 'package:intershiptasks/screen/custom_list_screen/bloc/customlist_bloc.dart';
import 'package:intershiptasks/screen/list_details_screen/list_details_Screen.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/horizontal_list_card.dart';
import 'package:intershiptasks/widgets/list_card.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

int screenId = 2;

class CUSTOMLISTSCREEN extends StatefulWidget {
  CUSTOMLISTSCREEN({Key? key}) : super(key: key);

  @override
  _CUSTOMLISTSCREENState createState() => _CUSTOMLISTSCREENState();
}

class _CUSTOMLISTSCREENState extends State<CUSTOMLISTSCREEN> {
  late CustomlistBloc customlistBloc;
  @override
  void initState() {
    super.initState();
    customlistBloc = CustomlistBloc()..add(CustomlistInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomlistBloc, CustomlistState>(
      bloc: customlistBloc,
      listener: (context, state) {},
      child: BlocBuilder<CustomlistBloc, CustomlistState>(
        bloc: customlistBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text_Widget(
                  text: StringResource.listHorizontalVertical,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium),
            ),
            body: Padding(
              padding: const EdgeInsets.all(SizeResource.size10),
              child: Column(
                children: [
                  TABNAVIGATION(screenId: screenId),
                  SizedBox(height: SizeResource.size40),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text_Widget(
                      text: StringResource.VerticalListView,
                      font_size: SizeResource.size20,
                      colour: ColorResource.colorblack,
                      font_family: FontFamilyResource.PoppinsSemiBold,
                    ),
                  ),
                  SizedBox(height: SizeResource.size10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorResource.color0066cc,
                      border: Border.all(
                        color: ColorResource.color0066cc,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        SizeResource.size10,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width -
                            SizeResource.size20,
                        height: SizeResource.size250,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LISTDETAILSSCREEN(
                                        iD: movielist[index]['id'])));
                              },
                              child: listCard(
                                title: movielist[index][StringResource.Name],
                                subTitle: movielist[index]
                                    [StringResource.ReleaseDate],
                                imgPath: movielist[index]
                                    [StringResource.imgPath],
                                //priceText: movielist[index]
                                //[StringResource.price_text],
                              ),
                            );
                          },
                          itemCount: movielist.length,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeResource.size40),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text_Widget(
                      text: StringResource.HorizontalListView,
                      font_size: SizeResource.size20,
                      colour: ColorResource.colorblack,
                      font_family: FontFamilyResource.PoppinsSemiBold,
                    ),
                  ),
                  SizedBox(height: SizeResource.size10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorResource.color0066cc,
                      border: Border.all(
                        color: ColorResource.color0066cc,
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(SizeResource.size10),
                    child: SizedBox(
                      width: double.infinity,
                      height: SizeResource.size120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movielist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LISTDETAILSSCREEN(
                                      iD: movielist[index]['id'])));
                            },
                            child: HORIZONTALLISTCARD(
                              title: movielist[index][StringResource.Name],
                              subTitle: movielist[index]
                                  [StringResource.ReleaseDate],
                              imgPath: movielist[index][StringResource.imgPath],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
