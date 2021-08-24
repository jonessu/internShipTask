import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/animation_screen/bloc/animation_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/image_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:shimmer/shimmer.dart';

int screenId = 19;

class AnimationScreen extends StatefulWidget {
  AnimationScreen({Key? key}) : super(key: key);

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationBloc animationBloc;
  @override
  void initState() {
    super.initState();
    animationBloc = AnimationBloc()..add(AnimationInitialEvent());
  }

  bool heightSelected = false;
  bool widthSelected = false;
  bool alignmentSelected = false;
  bool colorSelected = false;
  double _size = 50.0;
  bool _large = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnimationBloc, AnimationState>(
      bloc: animationBloc,
      listener: (context, state) {},
      child: BlocBuilder<AnimationBloc, AnimationState>(
        bloc: animationBloc,
        builder: (context, state) {
          if (state is AnimationLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is AnimationLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.Animation,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(SizeResource.size10),
                  child: Column(
                    children: [
                      TABNAVIGATION(screenId: screenId),
                      SizedBox(height: SizeResource.size30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text_Widget(
                          text: StringResource.HeroAnimation,
                          font_size: SizeResource.size30,
                          colour: ColorResource.colorblack,
                          font_family: FontFamilyResource.PoppinsSemiBold,
                        ),
                      ),
                      SizedBox(height: SizeResource.size20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: StringResource.heroImageTag,
                            child: Image.asset(
                              ImageResource.HeroAnimationLogo,
                              width: SizeResource.size40,
                              height: SizeResource.size40,
                            ),
                          ),
                          SizedBox(width: 30),
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(seconds: 2),
                                      pageBuilder: (_, __, ___) =>
                                          AnimationDemoScreen()));
                            },
                            child: Hero(
                              tag: StringResource.heroTextTag,
                              child: Text_Widget(
                                text: StringResource.ClickToUseHeroAnimation,
                                font_size: SizeResource.size12,
                                colour: ColorResource.color1c1d22,
                                font_family: FontFamilyResource.PoppinsSemiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeResource.size20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text_Widget(
                          text: StringResource.ShimmerAnimation,
                          font_size: SizeResource.size30,
                          colour: ColorResource.colorblack,
                          font_family: FontFamilyResource.PoppinsSemiBold,
                        ),
                      ),
                      SizedBox(height: SizeResource.size20),
                      SizedBox(
                        width: double.infinity,
                        height: SizeResource.size30,
                        child: Shimmer.fromColors(
                          baseColor: ColorResource.colorgrey300,
                          highlightColor: ColorResource.colorwhite,
                          period: Duration(microseconds: 15),
                          child: Container(
                            height: SizeResource.size20,
                            width: double.infinity,
                            color: ColorResource.colorgrey,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeResource.size20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text_Widget(
                          text: StringResource.AnimatedSize,
                          font_size: SizeResource.size30,
                          colour: ColorResource.colorblack,
                          font_family: FontFamilyResource.PoppinsSemiBold,
                        ),
                      ),
                      SizedBox(height: SizeResource.size20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _size = _large ? 250.0 : 100.0;
                            _large = !_large;
                          });
                        },
                        child: Container(
                          color: Colors.amberAccent,
                          child: AnimatedSize(
                            vsync: this,
                            curve: Curves.easeIn,
                            duration: const Duration(seconds: 1),
                            child: FlutterLogo(size: _size),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeResource.size10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text_Widget(
                          text: StringResource.AnimatedContainer,
                          font_size: SizeResource.size30,
                          colour: ColorResource.colorblack,
                          font_family: FontFamilyResource.PoppinsSemiBold,
                        ),
                      ),
                      SizedBox(height: SizeResource.size20),
                      AnimatedContainer(
                        width: widthSelected ? 200.0 : 100.0,
                        height: heightSelected ? 100.0 : 200.0,
                        color: colorSelected ? Colors.red : Colors.blue,
                        alignment: alignmentSelected
                            ? Alignment.center
                            : AlignmentDirectional.topCenter,
                        duration: const Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        child: const FlutterLogo(size: 75),
                      ),
                      SizedBox(height: SizeResource.size30),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            heightSelected = !heightSelected;
                          });
                        },
                        child: Text_Widget(
                          text: StringResource.ChangeHeight,
                          font_size: SizeResource.size12,
                          colour: ColorResource.color1c1d22,
                          font_family: FontFamilyResource.PoppinsSemiBold,
                        ),
                      ),
                      SizedBox(height: SizeResource.size10),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            widthSelected = !widthSelected;
                          });
                        },
                        child: Text_Widget(
                          text: StringResource.ChangeWidth,
                          font_size: SizeResource.size12,
                          colour: ColorResource.color1c1d22,
                          font_family: FontFamilyResource.PoppinsSemiBold,
                        ),
                      ),
                      SizedBox(height: SizeResource.size10),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            colorSelected = !colorSelected;
                          });
                        },
                        child: Text_Widget(
                          text: StringResource.ChangeColor,
                          font_size: SizeResource.size12,
                          colour: ColorResource.color1c1d22,
                          font_family: FontFamilyResource.PoppinsSemiBold,
                        ),
                      ),
                      SizedBox(height: SizeResource.size10),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            alignmentSelected = !alignmentSelected;
                          });
                        },
                        child: Text_Widget(
                          text: StringResource.ChangeAlignment,
                          font_size: SizeResource.size12,
                          colour: ColorResource.color1c1d22,
                          font_family: FontFamilyResource.PoppinsSemiBold,
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

class AnimationDemoScreen extends StatelessWidget {
  const AnimationDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30),
              GestureDetector(
                child: Hero(
                  tag: StringResource.heroTextTag,
                  child: Text_Widget(
                    text: StringResource.HeroAnimation,
                    font_size: SizeResource.size20,
                    colour: ColorResource.color1c1d22,
                    font_family: FontFamilyResource.PoppinsSemiBold,
                  ),
                ),
              ),
              Hero(
                tag: StringResource.heroImageTag,
                child: Image.asset(
                  ImageResource.HeroAnimationLogo,
                  width: SizeResource.size250,
                  height: SizeResource.size250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
