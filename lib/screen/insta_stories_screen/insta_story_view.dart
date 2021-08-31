import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intershiptasks/data/models/story_model.dart';
import 'package:intershiptasks/screen/insta_stories_screen/insta_stories_screen.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/widgets/story_button.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

class StoryView extends StatefulWidget {
  final StoryData story;
  StoryView({Key? key, required this.story}) : super(key: key);

  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  double percent = 0.0;
  late Timer timer;
  void startTimer() {
    timer = Timer.periodic(Duration(microseconds: 10), (timer) {
      setState(() {
        percent += 0.0001;
        if (percent > 1) {
          timer.cancel();
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    print(widget.story);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          timer.cancel();
          if (widget.story.id == 4) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => InstastoryScreen()));
          } else {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    StoryView(story: stories[widget.story.id + 1])));
          }
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.story.storyUrl),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 8.0),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: percent,
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.story.avatarUrl),
                        radius: 30.0,
                      ),
                      SizedBox(width: 8.0),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text_Widget(
                          text: widget.story.userName,
                          font_size: SizeResource.size20,
                          colour: ColorResource.color1c1d22,
                          font_family: FontFamilyResource.PoppinsMedium,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
