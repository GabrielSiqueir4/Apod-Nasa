import 'package:appprova/src/components/navigation.dart';
import 'package:appprova/src/screens/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NasaApod());
}

class NasaApod extends StatelessWidget {
  const NasaApod({Key? key}) : super(key: key);

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
