import 'package:flutter/material.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:pointycastle/pointycastle.dart' as crypto;
import 'package:rsa_encrypt/rsa_encrypt.dart';

class Encryptionspage extends StatefulWidget {
  @override
  _EncryptionsPageWidget createState() => _EncryptionsPageWidget();
}

class _EncryptionsPageWidget extends State {
  TextEditingController passcontroller = TextEditingController();
  late String encryptText = "";
  late String decryptText = "";
  late String plainText = "";

  late Future<crypto.AsymmetricKeyPair> futureKeyPair;

//to store the KeyPair once we get data from our future
  late crypto.AsymmetricKeyPair keyPair;

  Future<crypto.AsymmetricKeyPair<crypto.PublicKey, crypto.PrivateKey>>
      getKeyPair() {
    var helper = RsaKeyHelper();
    return helper.computeRSAKeyPair(helper.getSecureRandom());
  }

  @override
  Widget build(BuildContext context) {
    futureKeyPair = getKeyPair();
    futureKeyPair.then((value) {
      keyPair = value;

      encryptText = encrypt(
          passcontroller.text, keyPair.publicKey as crypto.RSAPublicKey);
      print("Encrpted : " + encryptText);
      decryptText =
          decrypt(encryptText, keyPair.privateKey as crypto.RSAPrivateKey);
      print("Decrpted : " + decryptText);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Encryptions Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                      controller: passcontroller,
                      keyboardType: TextInputType.emailAddress,
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
              TextButton(
                child: Text("Click Here"),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.pink),
                ),
                onPressed: () {
                  setState(() {
                    //futureKeyPair = getKeyPair();
                    plainText = passcontroller.text;
                    // encryptText = encrypt(passcontroller.text,
                    //     keyPair.publicKey as crypto.RSAPublicKey);

                    print("Encrpted : " + encryptText);
                  });
                },
              ),

              //Text(encrypt(passcontroller.text, keyPair.publicKey)),

              SizedBox(height: 20.0),
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
                    child: Text(plainText == "" ? "" : plainText),
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
                    child: Text(encryptText == "" ? "" : encryptText),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "DECRYPTED TEXT",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue[400],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(decryptText == "" ? "" : decryptText),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}


  // void rsaEncrypt(String plainText) async {
  //   final publicPem = await rootBundle.loadString('assets/public.pem');
  //   final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
  //   final encrypter = encrypt.Encrypter(encrypt.RSA(publicKey: publicKey));
  //   print(publicKey.hashCode);
  //   print(encrypter.hashCode);
  //   setState(() {
  //     encryptedText = encrypter.encrypt(plainText);
  //     rsaEncrptText = encryptedText.base64;
  //     print("RSA" + rsaEncrptText);
  //   });
  // }

  // // ignore: non_constant_identifier_names
  // void Decrypt() async {
  //   final privatePem = await rootBundle.loadString('assets/private.pem');
  //   final privateKey = RSAKeyParser().parse(privatePem) as RSAPrivateKey;
  //   final encrypter = encrypt.Encrypter(encrypt.RSA(privateKey: privateKey));
  //   print(privateKey.hashCode);
  //   print(encrypter.hashCode);
  //   setState(() {
  //     rsaDecryptText = encrypter.decrypt(encryptedText);
  //     print(rsaEncrptText);
  //   });
  // }

