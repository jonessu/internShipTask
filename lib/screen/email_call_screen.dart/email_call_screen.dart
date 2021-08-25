import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/email_call_screen.dart/bloc/emailcall_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

int screenId = 34;

class EmailcallScreen extends StatefulWidget {
  EmailcallScreen({Key? key}) : super(key: key);

  @override
  _EmailcallScreenState createState() => _EmailcallScreenState();
}

class _EmailcallScreenState extends State<EmailcallScreen> {
  late EmailcallBloc emailcallBloc;
  @override
  void initState() {
    super.initState();
    emailcallBloc = EmailcallBloc()..add(EmailcallInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailcallBloc, EmailcallState>(
      bloc: emailcallBloc,
      listener: (context, state) {},
      child: BlocBuilder<EmailcallBloc, EmailcallState>(
        bloc: emailcallBloc,
        builder: (context, state) {
          if (state is EmailcallLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is EmailcallLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.EmailCall,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: Column(
                children: [
                  TABNAVIGATION(screenId: screenId),
                  Container(
                    height: MediaQuery.of(context).size.height - 150,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BuildButton(
                              text: "Open Email",
                              onClicked: () async {
                                String? encodeQueryParameters(
                                    Map<String, String> params) {
                                  return params.entries
                                      .map((e) =>
                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                      .join('&');
                                }

                                final Uri emailLaunchUri = Uri(
                                  scheme: 'mailto',
                                  path: 'info@example.com',
                                  query: encodeQueryParameters(<String, String>{
                                    'subject': 'This is the example of Email'
                                  }),
                                );

                                await launch(emailLaunchUri.toString());
                              },
                            ),
                            SizedBox(height: SizeResource.size20),
                            BuildButton(
                              text: "Open Call",
                              onClicked: () async {
                                await launch('tel:+911234567890');
                              },
                            ),
                            SizedBox(height: SizeResource.size20),
                            BuildButton(
                              text: "Open SMS",
                              onClicked: () async {
                                const uri =
                                    'sms:+39 348 060 888?body=hello%20there';
                                await launch(uri);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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

class BuildButton extends StatelessWidget {
  final VoidCallback onClicked;
  final String text;
  const BuildButton({required this.text, required this.onClicked}) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onClicked, //sendotp,
          child: Container(
            width: double.infinity,
            height: 42,
            decoration: BoxDecoration(
              color: ColorResource.color0066cc,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text_Widget(
                text: text,
                font_size: SizeResource.size12,
                colour: ColorResource.colorwhite,
                font_family: FontFamilyResource.PoppinsSemiBold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
