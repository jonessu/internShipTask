import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/tap_to_speak_screen/bloc/tapspeak_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

int screenId = 22;

class TapspeakScreen extends StatefulWidget {
  TapspeakScreen({Key? key}) : super(key: key);

  @override
  _TapspeakScreenState createState() => _TapspeakScreenState();
}

class _TapspeakScreenState extends State<TapspeakScreen> {
  late TapspeakBloc tapspeakBloc;
  String speakEnterController = "";
  TextToSpeech tts = TextToSpeech();
  bool isListening = false;
  String textSpeech = "Press the Button to Start Speaking!";
  @override
  void initState() {
    super.initState();
    tapspeakBloc = TapspeakBloc()..add(TapspeakInitialEvent());
  }

  void onListen() async {
    stt.SpeechToText speech = stt.SpeechToText();
    if (!isListening) {
      bool available = await speech.initialize(
        onStatus: (val) {
          print("onStatus: $val");
          if (val == 'done') {
            setState(() {
              isListening = false;
              speech.stop();
            });
          }
        },
        onError: (val) => print("onError: $val"),
      );
      if (available) {
        setState(() {
          isListening = true;
        });
        speech.listen(
            onResult: (val) => setState(() {
                  textSpeech = val.recognizedWords;
                }));
      }
    } else {
      setState(() {
        isListening = false;
        speech.stop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TapspeakBloc, TapspeakState>(
      bloc: tapspeakBloc,
      listener: (context, state) {},
      child: BlocBuilder<TapspeakBloc, TapspeakState>(
        bloc: tapspeakBloc,
        builder: (context, state) {
          if (state is TapspeakLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is TapspeakLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.TaptoSpeak,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(SizeResource.size10),
                child: Column(
                  children: [
                    TABNAVIGATION(screenId: screenId),
                    SizedBox(height: SizeResource.size20),
                    Text_Widget(
                      text: textSpeech,
                      font_size: SizeResource.size30,
                      colour: ColorResource.color1c1d22,
                      font_family: FontFamilyResource.PoppinsSemiBold,
                    ),
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: AvatarGlow(
                animate: isListening,
                glowColor: Colors.blue,
                endRadius: 90.0,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: FloatingActionButton(
                  onPressed: () => onListen(),
                  child: Icon(isListening ? Icons.mic : Icons.mic_none),
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
