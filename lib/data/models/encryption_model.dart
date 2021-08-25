import 'dart:convert';
import 'dart:io';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:flutter/services.dart';
import 'package:pointycastle/pointycastle.dart' as crypto;
import 'package:pointycastle/asymmetric/api.dart';

class MyEncryptionDecryption {
  //For AES Encryption/Decryption
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);

  static final aesEncrypter = encrypt.Encrypter(encrypt.AES(key));

  static aesEncryptAES(text) {
    final encrypted = aesEncrypter.encrypt(text, iv: iv);

    return encrypted;
  }

  static aesDecryptAES(text) {
    final decrypted = aesEncrypter.decrypt(text, iv: iv);
    print(decrypted);
    return decrypted;
  }

  //for RSA Encryption
  // static final privKey = '...' as RSAPrivateKey;
  // static final publicKey = "..." as RSAPublicKey;

  static rsaEncryptRSA(text) async {
    // final publicKey = await parseKeyFromFile<RSAPublicKey>('test/public.pem');
    // final privKey = await parseKeyFromFile<RSAPrivateKey>('test/private.pem');
    // final rsaEncrypter = encrypt.Encrypter(
    //     encrypt.RSA(publicKey: publicKey, privateKey: privKey));
    // final encrypted = rsaEncrypter.encrypt(text);

    // final publicKey = await parseKeyFromFile<RSAPublicKey>(
    //     'C:\Intenship\intershiptasks\assets/public.pem');

    // final publicKeyFile = File('assets/public.pem');
    // final parser = RSAKeyParser();
    // final publicKey =
    //     parser.parse(publicKeyFile.readAsStringSync()) as RSAPublicKey;
    // final privateKeyFile = File('assets/private.pem');
    // final parserpri = RSAKeyParser();
    // final privKey =
    //     parserpri.parse(privateKeyFile.readAsStringSync()) as RSAPrivateKey;

    final publicPem = await rootBundle.loadString('assets/public.pem');
    final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
    final encrypter = encrypt.Encrypter(encrypt.RSA(publicKey: publicKey));
    print(publicKey.hashCode);
    print(encrypter.hashCode);
    final encrypted = encrypter.encrypt(text);
    print(encrypted.base64);

    return encrypted;
  }

  static rsaDecryptRSA(text) async {
    final publicKeyFile = File('assets/public.pem');
    final parser = RSAKeyParser();
    final publicKey =
        parser.parse(publicKeyFile.readAsStringSync()) as RSAPublicKey;
    final privateKeyFile = File('assets/private.pem');
    final parserpri = RSAKeyParser();
    final privKey =
        parserpri.parse(privateKeyFile.readAsStringSync()) as RSAPrivateKey;
    // final publicKey = await parseKeyFromFile<RSAPublicKey>('assets/public.pem');
    // final privKey = await parseKeyFromFile<RSAPrivateKey>('assets/private.pem');
    final rsaEncrypter = encrypt.Encrypter(
        encrypt.RSA(publicKey: publicKey, privateKey: privKey));
    final decrypted = rsaEncrypter.decrypt(text);
    print(decrypted);
    return decrypted;
  }
}
