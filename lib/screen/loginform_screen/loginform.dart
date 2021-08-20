import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intershiptasks/data/navigation_list.dart';
import 'package:intershiptasks/screen/custom_list_screen/custom_list_Screen.dart';
import 'package:intershiptasks/screen/loginform_screen/bloc/loginform_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

int screenId = 1;

class LOGINFORMSCREEN extends StatefulWidget {
  LOGINFORMSCREEN({Key? key}) : super(key: key);

  @override
  _LOGINFORMSCREENState createState() => _LOGINFORMSCREENState();
}

class _LOGINFORMSCREENState extends State<LOGINFORMSCREEN> {
  late LoginformBloc loginformBloc;

  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController usernameController;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginformBloc = LoginformBloc()..add(LoginformInitialEvent());
    usernameController = new TextEditingController();
    emailController = new TextEditingController();
    passController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginformBloc, LoginformState>(
      bloc: loginformBloc,
      listener: (context, state) {
        if (state is LoginformNavigationState) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CUSTOMLISTSCREEN()));
        }
      },
      child: BlocBuilder<LoginformBloc, LoginformState>(
        bloc: loginformBloc,
        builder: (context, state) {
          if (state is LoginformLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is LoginformLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                    text: StringResource.LoginFormWithValidations,
                    font_size: SizeResource.size20,
                    colour: ColorResource.colorwhite,
                    font_family: FontFamilyResource.PoppinsMedium),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TABNAVIGATION(screenId: screenId),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(SizeResource.size10),
                      child: Form(
                        autovalidate: true,
                        key: formkey,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: ListView(
                              children: <Widget>[
                                SizedBox(height: 50),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text_Widget(
                                    text:
                                        StringResource.LoginFormWithValidations,
                                    font_size: SizeResource.size20,
                                    colour: ColorResource.colorblack,
                                    font_family:
                                        FontFamilyResource.PoppinsMedium,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    autofocus: false,
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: StringResource.Username,
                                    ),
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: ColorResource.color616267,
                                      fontFamily:
                                          FontFamilyResource.PoppinsMedium,
                                    ),
                                    validator:
                                        loginformBloc.usernamerequiredValidator,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    //color: ColorResource.color0066cc,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    autofocus: false,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: StringResource.Email,
                                    ),
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: ColorResource.color616267,
                                      fontFamily:
                                          FontFamilyResource.PoppinsMedium,
                                    ),
                                    validator:
                                        loginformBloc.emailrequiredValidator,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: passController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: StringResource.Password,
                                    ),
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: ColorResource.color616267,
                                      fontFamily:
                                          FontFamilyResource.PoppinsMedium,
                                    ),
                                    validator:
                                        loginformBloc.passwordrequiredValidator,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (formkey.currentState!.validate()) {
                                      loginformBloc.add(LoginformClickEvent());
                                    }
                                  }, //sendotp,
                                  child: Container(
                                    width: double.infinity,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      color: ColorResource.color0066cc,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text_Widget(
                                        text: StringResource.Login,
                                        font_size: SizeResource.size12,
                                        colour: ColorResource.colorwhite,
                                        font_family:
                                            FontFamilyResource.PoppinsSemiBold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
