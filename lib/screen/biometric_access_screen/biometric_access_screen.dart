import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/biometric_access_screen/bloc/biometric_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:local_auth/local_auth.dart';

int screenId = 27;

class BiometricScreen extends StatefulWidget {
  BiometricScreen({Key? key}) : super(key: key);

  @override
  _BiometricScreenState createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  late BiometricBloc biometricBloc;
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    biometricBloc = BiometricBloc()..add(BiometricInitialEvent());
  }

  Future<void> authorizeNow() async {
    bool isAuthorized = false;
    try {
      isAuthorized = await auth.authenticate(
        localizedReason: "Please authenticate to complete your transaction",
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      );
    } catch (e) {
      print(e);
    }

    // if (!mounted) return;

    // setState(() {
    //   if (isAuthorized) {
    //     print("Authorized");
    //   } else {
    //     print("Not Authorized");
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BiometricBloc, BiometricState>(
      bloc: biometricBloc,
      listener: (context, state) {},
      child: BlocBuilder<BiometricBloc, BiometricState>(
        bloc: biometricBloc,
        builder: (context, state) {
          if (state is BiometricLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is BiometricLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.BiometricAccess,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: GestureDetector(
                onTap: authorizeNow,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ColorResource.colorb9b9bf,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("dlkdjkd"),
                  // child: Center(
                  //   child: Image.asset(
                  //     ImageResource.fingerprint,
                  //     width: 80,
                  //     height: 80,
                  //   ),
                  // ),
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

enum SupportState {
  unknown,
  supported,
  unsupported,
}
