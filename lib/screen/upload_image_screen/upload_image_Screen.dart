import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intershiptasks/screen/upload_image_screen/bloc/uploadimage_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:share/share.dart';

int screenId = 4;

class UPLOADIMAGESCREEN extends StatefulWidget {
  UPLOADIMAGESCREEN({Key? key}) : super(key: key);

  @override
  _UPLOADIMAGESCREENState createState() => _UPLOADIMAGESCREENState();
}

class _UPLOADIMAGESCREENState extends State<UPLOADIMAGESCREEN> {
  late UploadimageBloc uploadimageBloc;

  @override
  void initState() {
    super.initState();
    uploadimageBloc = UploadimageBloc()..add(UploadimageInitialEvent());
  }

  File? image;

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } catch (e) {
      print(e);
    }
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } catch (e) {
      print(e);
    }
  }

  _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    print(image!.path);
    await Share.shareFiles([image!.path, 'Image']);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadimageBloc, UploadimageState>(
      bloc: uploadimageBloc,
      listener: (context, state) {},
      child: BlocBuilder<UploadimageBloc, UploadimageState>(
        bloc: uploadimageBloc,
        builder: (context, state) {
          if (state is UploadimageLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is UploadimageLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.UploadImageFromCamera,
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
                      Column(
                        children: <Widget>[
                          image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    image!,
                                    width: 160,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : FlutterLogo(size: 160),
                          SizedBox(height: 120),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => pickImageFromCamera(),
                                child: Container(
                                  width: double.infinity,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.camera_alt_outlined,
                                            color: ColorResource.colorwhite),
                                        SizedBox(width: 20),
                                        Text_Widget(
                                          text: StringResource.PickCamera,
                                          font_size: SizeResource.size12,
                                          colour: ColorResource.colorwhite,
                                          font_family: FontFamilyResource
                                              .PoppinsSemiBold,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () => pickImageFromGallery(),
                                child: Container(
                                  width: double.infinity,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.image_outlined,
                                            color: ColorResource.colorwhite),
                                        SizedBox(width: 20),
                                        Text_Widget(
                                          text: StringResource.PickGallery,
                                          font_size: SizeResource.size12,
                                          colour: ColorResource.colorwhite,
                                          font_family: FontFamilyResource
                                              .PoppinsSemiBold,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              GestureDetector(
                                onTap: () {
                                  uploadimageBloc
                                      .add(UploadClickBtnEvnet(image: image));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text_Widget(
                                      text: StringResource.Upload,
                                      font_size: SizeResource.size12,
                                      colour: ColorResource.colorwhite,
                                      font_family:
                                          FontFamilyResource.PoppinsSemiBold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  Share.shareFiles([image!.path]);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text_Widget(
                                      text: StringResource.Share,
                                      font_size: SizeResource.size12,
                                      colour: ColorResource.colorwhite,
                                      font_family:
                                          FontFamilyResource.PoppinsSemiBold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
