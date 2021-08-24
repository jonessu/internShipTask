import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:intershiptasks/screen/localisation_screen/bloc/localisation_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:translator/translator.dart';

int screenId = 21;

class LocalisationScreen extends StatefulWidget {
  LocalisationScreen({Key? key}) : super(key: key);

  @override
  _LocalisationScreenState createState() => _LocalisationScreenState();
}

class _LocalisationScreenState extends State<LocalisationScreen> {
  late LocalisationBloc localisationBloc;
  final translator = GoogleTranslator();

  String languageEnterController = "";

  @override
  void initState() {
    super.initState();
    localisationBloc = LocalisationBloc()..add(LocalisationInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocalisationBloc, LocalisationState>(
      bloc: localisationBloc,
      listener: (context, state) {},
      child: BlocBuilder<LocalisationBloc, LocalisationState>(
        bloc: localisationBloc,
        builder: (context, state) {
          if (state is LocalisationLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is LocalisationLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.Localisation,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: Column(
                children: [
                  TABNAVIGATION(screenId: screenId),
                  Container(
                    height: MediaQuery.of(context).size.height - 190,
                    child: Center(
                      child: LocaleText(
                        StringResource.welcome,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
              drawer: MainDrawer(),

              // body: Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(SizeResource.size10),
              //     child: Column(
              //       children: [
              //         Container(
              //           width: double.infinity,
              //           height: 48,
              //           decoration: BoxDecoration(
              //             color: ColorResource.colorwhite,
              //             border: Border.all(
              //               color: ColorResource.colorb9b9bf,
              //               width: 1,
              //             ),
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Center(
              //             child: Padding(
              //               padding: const EdgeInsets.only(left: 15.0),
              //               child: TextFormField(
              //                 onChanged: (value) {
              //                   setState(() {
              //                     languageEnterController = value;
              //                   });
              //                 },
              //                 cursorColor: ColorResource.colorblack,
              //                 decoration: InputDecoration(
              //                   border: InputBorder.none,
              //                   hintStyle: TextStyle(
              //                     color: ColorResource.color616267,
              //                     fontSize: 13,
              //                     fontFamily: FontFamilyResource.PoppinsMedium,
              //                   ),
              //                 ),
              //                 style: TextStyle(
              //                   fontSize: 13,
              //                   color: ColorResource.color616267,
              //                   fontFamily: FontFamilyResource.PoppinsMedium,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(height: SizeResource.size30),
              //         Text_Widget(
              //           text: languageEnterController,
              //           font_size: SizeResource.size30,
              //           colour: ColorResource.color1c1d22,
              //           font_family: FontFamilyResource.PoppinsSemiBold,
              //         ),
              //         RaisedButton(
              //           onPressed: () {
              //             translator
              //                 .translate(languageEnterController, to: 'ta')
              //                 .then(print);
              //           },
              //           child: Text("Click Me!"),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: SizeResource.size30),
          ListTile(
            title: Text("English"),
            onTap: () {
              LocaleNotifier.of(context)!.change('en');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("دری"),
            onTap: () {
              LocaleNotifier.of(context)!.change('ar');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("மொழி"),
            onTap: () {
              LocaleNotifier.of(context)!.change('ta');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
