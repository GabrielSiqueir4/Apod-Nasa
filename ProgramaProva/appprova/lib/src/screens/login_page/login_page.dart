// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:appprova/src/components/navigation.dart';
import 'package:appprova/src/screens/favorito_page/favoritos_page.dart';
import 'package:appprova/src/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/videoestrelas.mp4')
          ..initialize().then((context) {
            _videoPlayerController.play();
            _videoPlayerController.setLooping(true);
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //usado para colocar o video de fundo e as imagens por cima dele
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: _videoPlayerController.value.size.height,
                width: _videoPlayerController.value.size.height,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Image.asset(
                  'assets/nasa.png',
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 50),
                Text(
                  'Seja Bem Vindo ao',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontFamily: 'Jost',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Astrolodia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'Jost',
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Navigation();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            top: 10, left: 30, right: 30, bottom: 10),
                        primary: Color.fromARGB(255, 148, 148, 148)),
                    icon: Icon(Icons.login),
                    label: Text('Entrar')),
                    
                    
              ],
            ),

          ),
        ],
      ),
    );
  }
}
