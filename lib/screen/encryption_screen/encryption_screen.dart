import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/data/models/encryption_model.dart';
import 'package:intershiptasks/screen/encryption_screen/bloc/encryption_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:rsa_encrypt/rsa_encrypt.dart';
import 'package:pointycastle/pointycastle.dart' as crypto;

int screenId = 16;

late EncryptionBloc encryptionBloc;

class EncryptionScreen extends StatefulWidget {
  EncryptionScreen({Key? key}) : super(key: key);

  @override
  _EncryptionScreenState createState() => _EncryptionScreenState();
}

class _EncryptionScreenState extends State<EncryptionScreen> {
  @override
  void initState() {
    super.initState();
    encryptionBloc = EncryptionBloc()..add(EncryptionInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EncryptionBloc, EncryptionState>(
      bloc: encryptionBloc,
      listener: (context, state) {},
      child: BlocBuilder<EncryptionBloc, EncryptionState>(
        bloc: encryptionBloc,
        builder: (context, state) {
          if (state is EncryptionLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is EncryptionLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.Encryption,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => aesEncrptDemo()));
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
                            text: "AES Encrpt Page",
                            font_size: SizeResource.size12,
                            colour: ColorResource.colorwhite,
                            font_family: FontFamilyResource.PoppinsSemiBold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeResource.size20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => rsaEncryptDemo()));
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
                            text: "RSA Encrpt Page",
                            font_size: SizeResource.size12,
                            colour: ColorResource.colorwhite,
                            font_family: FontFamilyResource.PoppinsSemiBold,
                          ),
                        ),
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

class aesEncrptDemo extends StatefulWidget {
  aesEncrptDemo({Key? key}) : super(key: key);

  @override
  _aesEncrptDemoState createState() => _aesEncrptDemoState();
}

class _aesEncrptDemoState extends State<aesEncrptDemo> {
  TextEditingController tec = TextEditingController();
  var encryptedText, plainText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text_Widget(
          text: "RSA Encrypt",
          font_size: SizeResource.size20,
          colour: ColorResource.colorwhite,
          font_family: FontFamilyResource.PoppinsMedium,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: tec,
            ),
          ),
          Column(
            children: [
              Text(
                "PLAIN TEXT",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[400],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(plainText == null ? "" : plainText),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "ENCRYPTED TEXT",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[400],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(encryptedText == null
                    ? ""
                    : encryptedText is encrypt.Encrypted
                        ? encryptedText.base64.toString()
                        : encryptedText.toString()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  plainText = tec.text;
                  setState(() {
                    encryptedText =
                        MyEncryptionDecryption.aesEncryptAES(plainText);
                  });

                  tec.clear();
                },
                child: Text("Encrypt"),
              ),
              SizedBox(
                width: 15,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    encryptedText =
                        MyEncryptionDecryption.aesDecryptAES(encryptedText);
                    print("Type: " + encryptedText.runtimeType.toString());
                  });
                },
                child: Text("Decrypt"),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class rsaEncryptDemo extends StatefulWidget {
  rsaEncryptDemo({Key? key}) : super(key: key);

  @override
  _rsaEncryptDemoState createState() => _rsaEncryptDemoState();
}

class _rsaEncryptDemoState extends State<rsaEncryptDemo> {
  TextEditingController tec = TextEditingController();
  var encryptedText, plainText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text_Widget(
          text: "RSA Encrypt",
          font_size: SizeResource.size20,
          colour: ColorResource.colorwhite,
          font_family: FontFamilyResource.PoppinsMedium,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: tec,
            ),
          ),
          Column(
            children: [
              Text(
                "PLAIN TEXT",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[400],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(plainText == null ? "" : plainText.toString()),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "ENCRYPTED TEXT",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[400],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(encryptedText == null ? "" : encryptedText.toString()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  plainText = tec.text;
                  setState(() {
                    encryptedText =
                        MyEncryptionDecryption.rsaEncryptRSA(plainText);
                    print("djkldjkd" + encryptedText);
                  });

                  tec.clear();
                },
                child: Text("Encrypt"),
              ),
              SizedBox(
                width: 15,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    encryptedText =
                        MyEncryptionDecryption.rsaDecryptRSA(encryptedText);
                    print("Type: " + encryptedText.runtimeType.toString());
                  });
                },
                child: Text("Decrypt"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
