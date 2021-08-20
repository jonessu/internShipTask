import 'package:flutter/material.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

class HORIZONTALLISTCARD extends StatelessWidget {
  const HORIZONTALLISTCARD({
    required this.title,
    required this.subTitle,
    required this.imgPath,
    Key? key,
  }) : super(key: key);
  final String title, subTitle, imgPath;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Container(
          width: 315,
          height: 128,
          child: Padding(
            padding: const EdgeInsets.all(SizeResource.size20),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(SizeResource.size10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorResource.colorwhite,
                      border: Border.all(
                        color: ColorResource.colore3e3e5,
                        width: 1,
                      ),
                    ),
                    child: Image.asset(imgPath)),
                SizedBox(width: SizeResource.size20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_Widget(
                      text: title,
                      font_size: SizeResource.size20,
                      colour: ColorResource.colorblack,
                      font_family: FontFamilyResource.PoppinsSemiBold,
                    ),
                    SizedBox(height: SizeResource.size10),
                    Text_Widget(
                      text: subTitle,
                      font_size: SizeResource.size20,
                      colour: ColorResource.color1c1d22,
                      font_family: FontFamilyResource.PoppinsSemiBold,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
