import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/walkthrough_screen/bloc/walkthrough_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/image_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

int screenId = 32;

class WalkthroughScreen extends StatefulWidget {
  WalkthroughScreen({Key? key}) : super(key: key);

  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  late WalkthroughBloc walkthroughBloc;
  @override
  void initState() {
    super.initState();
    walkthroughBloc = WalkthroughBloc()..add(WalkthroughInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalkthroughBloc, WalkthroughState>(
      bloc: walkthroughBloc,
      listener: (context, state) {},
      child: BlocBuilder<WalkthroughBloc, WalkthroughState>(
        bloc: walkthroughBloc,
        builder: (context, state) {
          if (state is WalkthroughLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is WalkthroughLoadedState) {
            return Scaffold(
              body: IntroductionScreen(
                done: Text_Widget(
                  text: "Done",
                  colour: ColorResource.color1c1d22,
                  font_size: SizeResource.size12,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
                next: Icon(Icons.arrow_forward),
                showSkipButton: true,
                skip: Text('Skip'),
                onDone: () {
                  Navigator.pop(context);
                },
                pages: [
                  PageViewModel(
                      title: StringResource.Title1,
                      image: Lottie.asset(ImageResource.AssetLottieImage1),
                      bodyWidget: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text_Widget(
                          text: StringResource.Content1,
                          colour: ColorResource.color1c1d22,
                          font_size: SizeResource.size20,
                          font_family: FontFamilyResource.PoppinsSemiBold,
                        ),
                      )),
                  PageViewModel(
                    image: Lottie.network(
                      'https://assets9.lottiefiles.com/packages/lf20_3ls8a1y5.json',
                    ),
                    title: StringResource.Title2,
                    body: StringResource.Content2,
                  ),
                  PageViewModel(
                    image: Lottie.network(
                      'https://assets9.lottiefiles.com/packages/lf20_sk5h1kfn.json',
                    ),
                    title: StringResource.Title3,
                    body: StringResource.Content3,
                  ),
                ],
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
