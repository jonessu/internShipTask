import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/lottie_view_animation_screen.dart/bloc/lottieview_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/image_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:lottie/lottie.dart';

int screenId = 20;

class LottieviewScreen extends StatefulWidget {
  LottieviewScreen({Key? key}) : super(key: key);

  @override
  _LottieviewScreenState createState() => _LottieviewScreenState();
}

class _LottieviewScreenState extends State<LottieviewScreen> {
  late LottieviewBloc lottieviewBloc;
  @override
  void initState() {
    super.initState();
    lottieviewBloc = LottieviewBloc()..add(LottieviewInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LottieviewBloc, LottieviewState>(
      bloc: lottieviewBloc,
      listener: (context, state) {},
      child: BlocBuilder<LottieviewBloc, LottieviewState>(
        bloc: lottieviewBloc,
        builder: (context, state) {
          if (state is LottieviewLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is LottieviewLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.LottieViewforAnimation,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      TABNAVIGATION(screenId: screenId),
                      Container(
                        width: 300,
                        height: 300,
                        child: Lottie.asset(ImageResource.AssetLottieImage1),
                      ),
                      Container(
                        width: 300,
                        height: 300,
                        child: Lottie.network(
                          ImageResource.NetworkLottieImage1,
                        ),
                      ),
                    ],
                  ),
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
