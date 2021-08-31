import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intershiptasks/screen/insta_story_share/bloc/storyshare_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_share/social_share.dart';
import 'package:screenshot/screenshot.dart';

int screenId = 35;

class StoryshareScreen extends StatefulWidget {
  StoryshareScreen({Key? key}) : super(key: key);

  @override
  _StoryshareScreenState createState() => _StoryshareScreenState();
}

class _StoryshareScreenState extends State<StoryshareScreen> {
  late StoryshareBloc storyshareBloc;
  @override
  void initState() {
    super.initState();
    storyshareBloc = StoryshareBloc()..add(StoryshareInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoryshareBloc, StoryshareState>(
      bloc: storyshareBloc,
      listener: (context, state) {},
      child: BlocBuilder<StoryshareBloc, StoryshareState>(
        bloc: storyshareBloc,
        builder: (context, state) {
          if (state is StoryshareLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is StoryshareLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.InstaStoryShare,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: Center(
                child: RaisedButton(
                  onPressed: () async {
                    XFile? file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    print(file!.path);
                    SocialShare.shareInstagramStory(
                      file.path,
                      backgroundTopColor: "#ffffff",
                      backgroundBottomColor: "#000000",
                      attributionURL: "https://www.instagram.com/hema.ghn/",
                    ).then((data) {
                      print(data);
                    });
                  },
                  child: Text("Share On Instagram Story"),
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
