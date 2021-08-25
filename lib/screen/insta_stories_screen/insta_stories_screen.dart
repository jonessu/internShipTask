import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/data/models/story_model.dart';
import 'package:intershiptasks/screen/insta_stories_screen/bloc/instastory_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/story_button.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

int screenId = 33;

class InstastoryScreen extends StatefulWidget {
  InstastoryScreen({Key? key}) : super(key: key);

  @override
  _InstastoryScreenState createState() => _InstastoryScreenState();
}

class _InstastoryScreenState extends State<InstastoryScreen> {
  late InstastoryBloc instastoryBloc;
  List<StoryData> stories = [
    StoryData("Jones", "https://randomuser.me/api/portraits/med/men/75.jpg",
        "https://images.unsplash.com/photo-1626549879159-280fff8c5cd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80"),
    StoryData("Sunil", "https://randomuser.me/api/portraits/med/men/75.jpg",
        "https://images.unsplash.com/photo-1626549879159-280fff8c5cd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80"),
    StoryData("Jones", "https://randomuser.me/api/portraits/med/men/75.jpg",
        "https://images.unsplash.com/photo-1626549879159-280fff8c5cd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80"),
    StoryData("Sunil", "https://randomuser.me/api/portraits/med/men/75.jpg",
        "https://images.unsplash.com/photo-1626549879159-280fff8c5cd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80"),
  ];
  bool isLiked = false;
  bool isHeartAnimating = false;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    instastoryBloc = InstastoryBloc()..add(InstastoryInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InstastoryBloc, InstastoryState>(
      bloc: instastoryBloc,
      listener: (context, state) {},
      child: BlocBuilder<InstastoryBloc, InstastoryState>(
        bloc: instastoryBloc,
        builder: (context, state) {
          if (state is InstastoryLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is InstastoryLoadedState) {
            return Scaffold(
                appBar: AppBar(
                  leadingWidth: 0.0,
                  backgroundColor: ColorResource.colorwhite,
                  title: Text_Widget(
                    text: StringResource.InstaLikeStories,
                    font_size: SizeResource.size20,
                    colour: ColorResource.color1c1d22,
                    font_family: FontFamilyResource.PoppinsMedium,
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 110.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            storyButton(stories[0], context),
                            storyButton(stories[1], context),
                            storyButton(stories[2], context),
                            storyButton(stories[3], context),
                            storyButton(stories[0], context),
                            storyButton(stories[1], context),
                            storyButton(stories[2], context),
                            storyButton(stories[3], context),
                          ],
                        ),
                      ),
                      Divider(height: 1),
                      SizedBox(height: 10.0),
                      GestureDetector(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                'https://images.unsplash.com/photo-1586325194227-7625ed95172b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=949&q=80',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Icon(isHeartAnimating ? Icons.favorite : null,
                                color: ColorResource.colorwhite, size: 100),
                          ],
                        ),
                        onDoubleTap: () {
                          setState(() {
                            isHeartAnimating = true;
                            isLiked = true;
                          });
                          timer = Timer(Duration(seconds: 2), () {
                            setState(() {
                              isHeartAnimating = false;
                              timer.cancel();
                            });
                          });
                        },
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: double.infinity,
                        height: 40.0,
                        color: ColorResource.color1c1d22,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                            child: Icon(Icons.favorite,
                                color: isLiked
                                    ? ColorResource.colorred
                                    : ColorResource.colorFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
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
