import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intershiptasks/screen/shared_preference_screen/bloc/sharedpreference_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

int screenId = 18;
TextEditingController emailController = TextEditingController();
TextEditingController pwdController = TextEditingController();

class SharedpreferenceScreen extends StatefulWidget {
  SharedpreferenceScreen({Key? key}) : super(key: key);

  @override
  _SharedpreferenceScreenState createState() => _SharedpreferenceScreenState();
}

class _SharedpreferenceScreenState extends State<SharedpreferenceScreen> {
  late SharedpreferenceBloc sharedpreferenceBloc;
  late Future<String> saveString;
  late String stringSaveController;
  late var sharedPreferenceEmailValue, sharedPreferencePwdValue;

  @override
  void initState() {
    super.initState();
    sharedpreferenceBloc = SharedpreferenceBloc()
      ..add(SharedpreferenceInitialEvent());
    printPreference();
  }

  printPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferenceEmailValue =
          prefs.getString(StringResource.emailnameKey) ?? "";
      sharedPreferencePwdValue =
          prefs.getString(StringResource.passwordnameKey) ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SharedpreferenceBloc, SharedpreferenceState>(
      bloc: sharedpreferenceBloc,
      listener: (context, state) {},
      child: BlocBuilder<SharedpreferenceBloc, SharedpreferenceState>(
        bloc: sharedpreferenceBloc,
        builder: (context, state) {
          if (state is SharedpreferenceLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is SharedpreferenceLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.SharedPreference,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    TABNAVIGATION(screenId: screenId),
                    Padding(
                      padding: const EdgeInsets.all(SizeResource.size20),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                              color: ColorResource.colorwhite,
                              border: Border.all(
                                color: ColorResource.colorb9b9bf,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      stringSaveController = value;
                                    });
                                  },
                                  controller: emailController,
                                  validator: RequiredValidator(
                                      errorText:
                                          StringResource.PleaseEnterText),
                                  cursorColor: ColorResource.colorblack,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: ColorResource.color616267,
                                      fontSize: 13,
                                      fontFamily:
                                          FontFamilyResource.PoppinsMedium,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: ColorResource.color616267,
                                    fontFamily:
                                        FontFamilyResource.PoppinsMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                              color: ColorResource.colorwhite,
                              border: Border.all(
                                color: ColorResource.colorb9b9bf,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      stringSaveController = value;
                                    });
                                  },
                                  controller: pwdController,
                                  validator: RequiredValidator(
                                      errorText:
                                          StringResource.PleaseEnterText),
                                  cursorColor: ColorResource.colorblack,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: ColorResource.color616267,
                                      fontSize: 13,
                                      fontFamily:
                                          FontFamilyResource.PoppinsMedium,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: ColorResource.color616267,
                                    fontFamily:
                                        FontFamilyResource.PoppinsMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeResource.size40),
                          RaisedButton(
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              if (stringSaveController == "") {
                              } else {
                                var name = prefs.setString(
                                    StringResource.emailnameKey,
                                    emailController.text);
                                prefs.setString(StringResource.passwordnameKey,
                                    pwdController.text);
                                print(name);
                                setState(() {
                                  sharedPreferenceEmailValue = prefs
                                      .getString(StringResource.emailnameKey);
                                  sharedPreferencePwdValue = prefs.getString(
                                      StringResource.passwordnameKey);
                                });
                                // Navigator.pop(context);
                              }
                            },
                            child: Text(StringResource.Save),
                          ),
                          SizedBox(height: SizeResource.size50),
                          Text_Widget(
                            text: sharedPreferenceEmailValue,
                            font_size: SizeResource.size30,
                            colour: ColorResource.color1c1d22,
                            font_family: FontFamilyResource.PoppinsSemiBold,
                          ),
                          SizedBox(height: 10),
                          Text_Widget(
                            text: sharedPreferencePwdValue,
                            font_size: SizeResource.size30,
                            colour: ColorResource.color1c1d22,
                            font_family: FontFamilyResource.PoppinsSemiBold,
                          ),
                        ],
                      ),
                    ),
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
