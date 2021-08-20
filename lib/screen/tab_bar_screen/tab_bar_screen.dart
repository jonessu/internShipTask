import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/tab_bar_screen/bloc/tabbar_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
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
