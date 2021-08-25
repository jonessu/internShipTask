import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/youtube_player_screen.dart/bloc/youtube_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

int screenId = 31;

class YoutubeScreen extends StatefulWidget {
  YoutubeScreen({Key? key}) : super(key: key);

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  late YoutubeBloc youtubeBloc;
  late YoutubePlayerController _controller;
  bool isPaused = false, isMute = false;

  @override
  void initState() {
    super.initState();
    youtubeBloc = YoutubeBloc()..add(YoutubeInitialEvent());
    _controller = YoutubePlayerController(
      initialVideoId: 'p2lYr3vM_1w',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: false,
        enableCaption: true,
        forceHD: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<YoutubeBloc, YoutubeState>(
      bloc: youtubeBloc,
      listener: (context, state) {},
      child: BlocBuilder<YoutubeBloc, YoutubeState>(
        bloc: youtubeBloc,
        builder: (context, state) {
          if (state is YoutubeLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is YoutubeLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.YoutubePlayer,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(SizeResource.size20),
                child: Column(
                  children: [
                    Container(
                      child: YoutubePlayer(
                        progressIndicatorColor: Colors.blueAccent,
                        controller: _controller,
                        liveUIColor: Colors.amber,
                        showVideoProgressIndicator: true,
                      ),
                    ),
                    SizedBox(height: SizeResource.size30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            isPaused ? _controller.play() : _controller.pause();
                            setState(() {
                              isPaused = isPaused ? false : true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: isPaused
                                ? Icon(Icons.play_arrow)
                                : Icon(Icons.pause),
                          ),
                        ),
                        SizedBox(width: SizeResource.size40),
                        GestureDetector(
                          onTap: () {
                            isMute ? _controller.unMute() : _controller.mute();
                            setState(() {
                              isMute = isMute ? false : true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: isMute
                                ? Icon(Icons.volume_up)
                                : Icon(Icons.volume_mute),
                          ),
                        ),
                      ],
                    )
                  ],
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
