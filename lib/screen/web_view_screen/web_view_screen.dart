import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/web_view_screen/bloc/webview_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

int screenId = 9;

class WebviewScreen extends StatefulWidget {
  WebviewScreen({Key? key}) : super(key: key);

  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebviewBloc webviewBloc;
  @override
  void initState() {
    super.initState();
    webviewBloc = WebviewBloc()..add(WebviewInitialEvent());
  }

  int currentIndex = 0;

  final tabs = [
    WebView(
      initialUrl: 'https://www.google.com/',
      onWebViewCreated: (WebViewController webViewController) {
        Completer<WebViewController>().complete(webViewController);
      },
    ),
    Center(
      child: GestureDetector(
        onTap: () {
          launch('https://www.google.com/',
              forceSafariVC: true,
              forceWebView: false,
              headers: <String, String>{'header_key': 'header_value'});
        },
        child: Text_Widget(
            text: "Click to Navigate Browser",
            font_size: SizeResource.size30,
            colour: ColorResource.color0066cc,
            font_family: FontFamilyResource.PoppinsRegular),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<WebviewBloc, WebviewState>(
      bloc: webviewBloc,
      listener: (context, state) {},
      child: BlocBuilder<WebviewBloc, WebviewState>(
        bloc: webviewBloc,
        builder: (context, state) {
          if (state is WebviewLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is WebviewLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.LoadURLinWebView,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: tabs[currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: ColorResource.color0066cc,
                currentIndex: currentIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.web_asset_off_outlined,
                      color: ColorResource.color0066cc,
                    ),
                    title: Text_Widget(
                      text: StringResource.Internal,
                      colour: ColorResource.colorwhite,
                      font_size: SizeResource.size30,
                      font_family: FontFamilyResource.PoppinsSemiBold,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.web_asset_off_outlined,
                      color: ColorResource.color0066cc,
                    ),
                    title: Text_Widget(
                      text: StringResource.External,
                      colour: ColorResource.colorwhite,
                      font_size: SizeResource.size30,
                      font_family: FontFamilyResource.PoppinsSemiBold,
                    ),
                  ),
                ],
              ),
              // body: WebView(
              //   initialUrl: 'https://www.wikipedia.org/',
              //   onWebViewCreated: (WebViewController webViewController) {
              //     _controller.complete(webViewController);
              //   },
              // ),
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
