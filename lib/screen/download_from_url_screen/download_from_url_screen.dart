import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:intershiptasks/screen/download_from_url_screen/bloc/download_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

int screenId = 26;

class DownloadScreen extends StatefulWidget {
  DownloadScreen({Key? key}) : super(key: key);

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  late DownloadBloc downloadBloc;
  TextEditingController urlController = TextEditingController();
  @override
  void initState() {
    super.initState();
    downloadBloc = DownloadBloc()..add(DownloadInitialEvent());
    FlutterDownloader.registerCallback(downloadCallback);
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadBloc, DownloadState>(
      bloc: downloadBloc,
      listener: (context, state) {},
      child: BlocBuilder<DownloadBloc, DownloadState>(
        bloc: downloadBloc,
        builder: (context, state) {
          if (state is DownloadLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is DownloadLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.DownloadfromURL,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
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
                              controller: urlController,
                              // onChanged: (value) {
                              //   setState(() {
                              //     fromCurrencyValue = value;
                              //   });
                              // },
                              cursorColor: ColorResource.colorblack,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: ColorResource.color616267,
                                  fontSize: 13,
                                  fontFamily: FontFamilyResource.PoppinsMedium,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 13,
                                color: ColorResource.color616267,
                                fontFamily: FontFamilyResource.PoppinsMedium,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                      child: Text(StringResource.StartDownloadinginaboveURL),
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      onPressed: () async {
                        final status = await Permission.storage.request();

                        if (status.isGranted && urlController.text != "") {
                          final externalDir =
                              await getExternalStorageDirectory();

                          final id = await FlutterDownloader.enqueue(
                            url: urlController.text.toString(),
                            savedDir: externalDir!.path,
                            fileName: "download",
                            showNotification: true,
                            openFileFromNotification: true,
                          );
                          print("print value" + id.toString());
                          FlutterDownloader.registerCallback(downloadCallback);
                        } else {
                          print(StringResource.PermissionDeined);
                        }
                      },
                    ),
                    SizedBox(height: 60),
                    FlatButton(
                      child: Text(StringResource.StartDownloadingDefalutVideo),
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      onPressed: () async {
                        final status = await Permission.storage.request();

                        if (status.isGranted) {
                          final externalDir =
                              await getExternalStorageDirectory();

                          final id = await FlutterDownloader.enqueue(
                            //"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
                            url:
                                "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                            savedDir: externalDir!.path,
                            fileName: "download",
                            showNotification: true,
                            openFileFromNotification: true,
                          );

                          FlutterDownloader.registerCallback(downloadCallback);
                        } else {
                          print(StringResource.PermissionDeined);
                        }
                      },
                    )
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
