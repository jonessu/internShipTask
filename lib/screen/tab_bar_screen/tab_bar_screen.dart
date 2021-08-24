import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/data/models/tab4_model.dart';
import 'package:intershiptasks/screen/tab_bar_screen/bloc/tabbar_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

int screenId = 11;

class TabbarScreen extends StatefulWidget {
  TabbarScreen({Key? key}) : super(key: key);

  @override
  _TabbarScreenState createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  late TabbarBloc tabbarBloc;
  @override
  void initState() {
    super.initState();
    tabbarBloc = TabbarBloc()..add(TabbarInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TabbarBloc, TabbarState>(
      bloc: tabbarBloc,
      listener: (context, state) {},
      child: BlocBuilder<TabbarBloc, TabbarState>(
        bloc: tabbarBloc,
        builder: (context, state) {
          if (state is TabbarLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is TabbarLoadedState) {
            return DefaultTabController(
              length: tabbarBloc.choices.length,
              child: Scaffold(
                appBar: AppBar(
                  title: Text_Widget(
                    text: StringResource.TabBar,
                    font_size: SizeResource.size20,
                    colour: ColorResource.colorwhite,
                    font_family: FontFamilyResource.PoppinsMedium,
                  ),
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: tabbarBloc.choices.map((Choice choice) {
                      return Tab(
                        child: Row(
                          children: [
                            Text_Widget(
                              text: choice.title,
                              font_size: SizeResource.size20,
                              colour: ColorResource.colorwhite,
                              font_family: FontFamilyResource.PoppinsMedium,
                            ),
                            SizedBox(width: SizeResource.size10),
                            Icon(
                              choice.icon,
                              size: SizeResource.size20,
                              color: ColorResource.colorwhite,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                body: TabBarView(
                  children: tabbarBloc.choices
                      .map(
                        (Choice choice) => Padding(
                          padding: EdgeInsets.all(SizeResource.size20),
                          child: Column(
                            children: [
                              Icon(
                                choice.icon,
                                size: SizeResource.size40,
                                color: ColorResource.color1c1d22,
                              ),
                              SizedBox(height: SizeResource.size30),
                              Text_Widget(
                                text: choice.title,
                                font_size: SizeResource.size12,
                                colour: ColorResource.color1c1d22,
                                font_family: FontFamilyResource.PoppinsRegular,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
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
