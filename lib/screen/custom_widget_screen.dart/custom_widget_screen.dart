import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/custom_widget_screen.dart/bloc/customwidget_bloc.dart';

import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

int screenId = 5;

class CUSTOMWIDGETSCREEN extends StatefulWidget {
  CUSTOMWIDGETSCREEN({Key? key}) : super(key: key);

  @override
  _CUSTOMWIDGETSCREENState createState() => _CUSTOMWIDGETSCREENState();
}

class _CUSTOMWIDGETSCREENState extends State<CUSTOMWIDGETSCREEN> {
  bool switchValue = false;
  Color bulbColor = ColorResource.color000000;

  late CustomwidgetBloc customwidgetBloc;
  @override
  void initState() {
    super.initState();
    customwidgetBloc = CustomwidgetBloc()..add(CustomwidgetInitialEvent());
  }

  final checkBoxList = [
    CheckBoxModel(title: 'CheckBox 1'),
    CheckBoxModel(title: 'CheckBox 2'),
    CheckBoxModel(title: 'CheckBox 3'),
    CheckBoxModel(title: 'CheckBox 4'),
  ];

  onItemClicked(CheckBoxModel ckbitem) {
    final newValue = !ckbitem.value;
    setState(() {
      ckbitem.value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomwidgetBloc, CustomwidgetState>(
      bloc: customwidgetBloc,
      listener: (context, state) {},
      child: BlocBuilder<CustomwidgetBloc, CustomwidgetState>(
        bloc: customwidgetBloc,
        builder: (context, state) {
          if (state is CustomwidgetLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is CustomwidgetLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.CustomWidgets,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(SizeResource.size10),
                  child: Column(
                    children: [
                      TABNAVIGATION(screenId: screenId),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text_Widget(
                            text: StringResource.CustomTextField,
                            font_size: SizeResource.size12,
                            colour: ColorResource.color1c1d22,
                            font_family: FontFamilyResource.PoppinsSemiBold),
                      ),
                      custom_textfield_widget(),
                      SizedBox(height: SizeResource.size20),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text_Widget(
                            text: StringResource.CustomButton,
                            font_size: SizeResource.size12,
                            colour: ColorResource.color1c1d22,
                            font_family: FontFamilyResource.PoppinsSemiBold),
                      ),
                      SizedBox(height: SizeResource.size10),
                      custom_button_widget(),
                      SizedBox(height: SizeResource.size20),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text_Widget(
                            text: StringResource.CustomSwitch,
                            font_size: SizeResource.size12,
                            colour: ColorResource.color1c1d22,
                            font_family: FontFamilyResource.PoppinsSemiBold),
                      ),
                      SizedBox(height: SizeResource.size10),
                      CUSTOMSWITCHWIDGET(),
                      SizedBox(height: SizeResource.size20),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text_Widget(
                            text: StringResource.CustomRadioButton,
                            font_size: SizeResource.size12,
                            colour: ColorResource.color1c1d22,
                            font_family: FontFamilyResource.PoppinsSemiBold),
                      ),
                      SizedBox(height: SizeResource.size10),
                      Icon(
                        Icons.lightbulb_outline,
                        size: 100,
                        color: bulbColor,
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          children: [
                            Radio(
                              value: Colors.red,
                              groupValue: bulbColor,
                              onChanged: (val) {
                                setState(() {
                                  bulbColor = ColorResource.colorred;
                                });
                              },
                            ),
                            Text(
                              StringResource.red,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          children: [
                            Radio(
                              value: Colors.grey,
                              groupValue: bulbColor,
                              onChanged: (val) {
                                setState(() {
                                  bulbColor = ColorResource.colorgrey;
                                });
                              },
                            ),
                            Text(
                              StringResource.grey,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeResource.size20),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text_Widget(
                          text: StringResource.CustomCheckBox,
                          font_size: SizeResource.size12,
                          colour: ColorResource.color1c1d22,
                          font_family: FontFamilyResource.PoppinsSemiBold,
                        ),
                      ),
                      SizedBox(height: SizeResource.size10),
                      ...checkBoxList
                          .map(
                            (item) => ListTile(
                              onTap: () => onItemClicked(item),
                              leading: Checkbox(
                                value: item.value,
                                onChanged: (value) => onItemClicked(item),
                              ),
                              title: Text(
                                item.title,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container(
            color: ColorResource.colorred,
          );
        },
      ),
    );
  }
}

class CheckBoxModel {
  String title;
  bool value;
  CheckBoxModel({required this.title, this.value = false});
}

class CUSTOMRIDIOWIDGET extends StatelessWidget {
  final int value;
  final String textValue;
  const CUSTOMRIDIOWIDGET({required this.value, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: 1,
          activeColor: ColorResource.colorblue,
          onChanged: (value) {
            print(value);
          },
        ),
        Text(
          textValue,
          style: TextStyle(
            color: ColorResource.color616267,
            //Color0xff616267),
            fontSize: 13,
            fontFamily: FontFamilyResource.PoppinsMedium,
          ),
        ),
      ],
    );
  }
}

class CUSTOMSWITCHWIDGET extends StatefulWidget {
  CUSTOMSWITCHWIDGET();

  @override
  _CUSTOMSWITCHWIDGETState createState() => _CUSTOMSWITCHWIDGETState();
}

class _CUSTOMSWITCHWIDGETState extends State<CUSTOMSWITCHWIDGET> {
  late CustomwidgetBloc customwidgetBloc;
  @override
  void initState() {
    customwidgetBloc = CustomwidgetBloc()..add(CustomwidgetInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Switch(
            value: customwidgetBloc.switchValue,
            onChanged: (bool newvalue) {
              setState(() {
                customwidgetBloc.switchValue = newvalue;
              });
            }),
        Text_Widget(
          text: customwidgetBloc.switchValue.toString(),
          font_size: SizeResource.size20,
          colour: ColorResource.color1c1d22,
          font_family: FontFamilyResource.PoppinsMedium,
        ),
      ],
    );
  }
}

class custom_button_widget extends StatelessWidget {
  const custom_button_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 10,
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(StringResource.ClickToAlertDialog),
            content: Text(StringResource.ExampleCustomAlearDialog),
          );
        },
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              StringResource.ClickToAlertDialog,
              style: TextStyle(
                fontSize: SizeResource.size20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class custom_textfield_widget extends StatelessWidget {
  const custom_textfield_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: StringResource.Password,
        ),
        style: TextStyle(
          fontSize: 13,
          color: ColorResource.color616267,
          fontFamily: FontFamilyResource.PoppinsMedium,
        ),
      ),
    );
  }
}
