import 'package:flutter/material.dart';
import 'package:intershiptasks/data/models/story_model.dart';
import 'package:intershiptasks/data/navigation_list.dart';
import 'package:intershiptasks/screen/animation_screen/animation_screen.dart';
import 'package:intershiptasks/screen/biometric_access_screen/biometric_access_screen.dart';
import 'package:intershiptasks/screen/bottom_sheet_scree/bottom_sheet_scree.dart';
import 'package:intershiptasks/screen/contact_access_screen/contact_access_screen.dart';
import 'package:intershiptasks/screen/custom_list_screen/custom_list_Screen.dart';
import 'package:intershiptasks/screen/custom_widget_screen.dart/custom_widget_screen.dart';
import 'package:intershiptasks/screen/download_from_url_screen/download_from_url_screen.dart';
import 'package:intershiptasks/screen/email_call_screen.dart/email_call_screen.dart';
import 'package:intershiptasks/screen/encryption_screen/encryption_screen.dart';
import 'package:intershiptasks/screen/exchange_rates_calculator_screen/exchange_rates_calculator_screen.dart';
import 'package:intershiptasks/screen/insta_stories_screen/insta_stories_screen.dart';
import 'package:intershiptasks/screen/insta_story_page_navigate.dart';
import 'package:intershiptasks/screen/insta_story_share/insta_story_share.dart';
import 'package:intershiptasks/screen/localisation_screen/localisation_screen.dart';
import 'package:intershiptasks/screen/location_map_screen/location_map_screen.dart';
import 'package:intershiptasks/screen/loginform_screen/loginform.dart';
import 'package:intershiptasks/screen/lottie_view_animation_screen.dart/lottie_view_animation_screen.dart';
import 'package:intershiptasks/screen/push_notification_screen/push_notification_screen.dart';
import 'package:intershiptasks/screen/search_list_screen/search_list_screen.dart';
import 'package:intershiptasks/screen/selection_screen/selection_screen.dart';
import 'package:intershiptasks/screen/shared_preference_screen/shared_preference_screen.dart';
import 'package:intershiptasks/screen/tab_bar_screen/tab_bar_screen.dart';
import 'package:intershiptasks/screen/tap_to_speak_screen/tap_to_speak_screen.dart';
import 'package:intershiptasks/screen/upload_image_screen/upload_image_Screen.dart';
import 'package:intershiptasks/screen/walkthrough_screen/walkthrough_screen.dart';
import 'package:intershiptasks/screen/web_view_screen/web_view_screen.dart';
import 'package:intershiptasks/screen/youtube_player_screen.dart/youtube_player_screen.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';

class TABNAVIGATION extends StatelessWidget {
  int screenId;
  TABNAVIGATION({required this.screenId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - SizeResource.size20,
        height: SizeResource.size30,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: navigatelist.length,
          itemBuilder: (context, index) {
            if (navigatelist[index]['pageId'] == screenId) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: SizeResource.size10),
                child: Container(
                  width: 20,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorResource.colorred,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Center(
                      child: Text(navigatelist[index]['pageId'].toString())),
                ),
              );
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: SizeResource.size10),
                child: GestureDetector(
                  onTap: () {
                    if (navigatelist[index]['pageId'] == 1) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LOGINFORMSCREEN()));
                    } else if (navigatelist[index]['pageId'] == 2) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CUSTOMLISTSCREEN()));
                    } else if (navigatelist[index]['pageId'] == 4) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UPLOADIMAGESCREEN()));
                    } else if (navigatelist[index]['pageId'] == 5) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CUSTOMWIDGETSCREEN()));
                    } else if (navigatelist[index]['pageId'] == 6) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomsheetSCREEN()));
                    } else if (navigatelist[index]['pageId'] == 7) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchlistSCREEN()));
                    } else if (navigatelist[index]['pageId'] == 8) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SelectionSCREEN()));
                    } else if (navigatelist[index]['pageId'] == 9) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WebviewScreen()));
                    } else if (navigatelist[index]['pageId'] == 10) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LocationmapScreen()));
                    } else if (navigatelist[index]['pageId'] == 11) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TabbarScreen()));
                    } else if (navigatelist[index]['pageId'] == 12) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContactScreen()));
                    } else if (navigatelist[index]['pageId'] == 16) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EncryptionScreen()));
                    } else if (navigatelist[index]['pageId'] == 18) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SharedpreferenceScreen()));
                    } else if (navigatelist[index]['pageId'] == 19) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimationScreen()));
                    } else if (navigatelist[index]['pageId'] == 20) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LottieviewScreen()));
                    } else if (navigatelist[index]['pageId'] == 21) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LocalisationScreen()));
                    } else if (navigatelist[index]['pageId'] == 22) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TapspeakScreen()));
                    } else if (navigatelist[index]['pageId'] == 23) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => exchangeScreen()));
                    } else if (navigatelist[index]['pageId'] == 26) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DownloadScreen()));
                    } else if (navigatelist[index]['pageId'] == 27) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BiometricScreen()));
                    } else if (navigatelist[index]['pageId'] == 28) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                    } else if (navigatelist[index]['pageId'] == 31) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => YoutubeScreen()));
                    } else if (navigatelist[index]['pageId'] == 32) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WalkthroughScreen()));
                    } else if (navigatelist[index]['pageId'] == 33) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InstastoryScreen()));
                    } else if (navigatelist[index]['pageId'] == 34) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EmailcallScreen()));
                    } else if (navigatelist[index]['pageId'] == 35) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StoryshareScreen()));
                    } else if (navigatelist[index]['pageId'] == 36) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StoryScreen(
                                stories1: stories1,
                              )));
                    }
                  },
                  child: Container(
                    width: 20,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorResource.colorblue,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Center(
                        child: Text(navigatelist[index]['pageId'].toString())),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
