//Aluno: Pedro H. G. Cangemi
//Cóigo: 830934

//Email para entrar : email@email.com"
// senha : 123456

import 'dart:io';

import 'package:barber_shop_app/pages/Home.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:barber_shop_app/pages/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';

import 'models/secrets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  const _scopes = [CalendarApi.calendarScope];

  var _credentials;
  if (Platform.isAndroid) {
    _credentials = ClientId(Secret.ANDROID_CLIENT_ID, "");
  } else if (Platform.isIOS) {
    _credentials = ClientId(Secret.IOS_CLIENT_ID, "");
  }

  final tokenSave = await SharedPreferences.getInstance();
  String? token = await tokenSave.getString("token");

  initializeDateFormatting().then((_) => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: token == null || token == '' ? const Login() : const Home(),
      )));
}
