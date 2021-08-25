import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intershiptasks/data/models/story_model.dart';
import 'package:intershiptasks/screen/insta_stories_screen/insta_story_view.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

Widget storyButton(StoryData story, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50.0),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StoryView(story: story)));
          },
          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(color: ColorResource.colorred, width: 2.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(image: NetworkImage(story.avatarUrl)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Align(
          alignment: Alignment.topLeft,
          child: Text_Widget(
            text: story.userName,
            font_size: SizeResource.size10,
            colour: ColorResource.color1c1d22,
            font_family: FontFamilyResource.PoppinsMedium,
          ),
        ),
      ],
    ),
  );
}
