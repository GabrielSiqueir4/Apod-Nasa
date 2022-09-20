import 'dart:io';
import 'package:appprova/src/screens/login_page/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(NasaApod());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class NasaApod extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     themeMode: ThemeMode.dark,
      title: 'Nasa Apod',
      home: LoginPage(),
      darkTheme: ThemeData.dark(),
    );
  }
}
