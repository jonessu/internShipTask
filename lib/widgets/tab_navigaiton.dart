import 'package:flutter/material.dart';
import 'package:intershiptasks/data/navigation_list.dart';
import 'package:intershiptasks/screen/bottom_sheet_scree/bottom_sheet_scree.dart';
import 'package:intershiptasks/screen/custom_list_screen/custom_list_Screen.dart';
import 'package:intershiptasks/screen/custom_widget_screen.dart/custom_widget_screen.dart';
import 'package:intershiptasks/screen/location_map_screen/location_map_screen.dart';
import 'package:intershiptasks/screen/loginform_screen/loginform.dart';
import 'package:intershiptasks/screen/search_list_screen/search_list_screen.dart';
import 'package:intershiptasks/screen/selection_screen/selection_screen.dart';
import 'package:intershiptasks/screen/tab_bar_screen/tab_bar_screen.dart';
import 'package:intershiptasks/screen/upload_image_screen/upload_image_Screen.dart';
import 'package:intershiptasks/screen/web_view_screen/web_view_screen.dart';
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
