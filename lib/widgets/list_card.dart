import 'package:flutter/material.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/image_resource.dart';

class listCard extends StatelessWidget {
  const listCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.imgPath,
    //required this.priceText
  }) : super(key: key);
  final String title, subTitle, imgPath; //, priceText;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ColorResource.colore3e3e5, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: ColorResource.color1c1d22, fontSize: 13),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(color: ColorResource.color9d9da9, fontSize: 14),
        ),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Image.asset(imgPath),
        ),
        trailing: Wrap(
          spacing: 5, // space between two icons
          children: <Widget>[
            // Text(
            //   priceText,
            //   style: TextStyle(
            //     color: ColorResource.color1c1d22,
            //     fontSize: 13,
            //   ),
            // ), // icon-1
            Icon(Icons.navigate_next_outlined),
          ],
        ),
      ),
    );
  }
}
