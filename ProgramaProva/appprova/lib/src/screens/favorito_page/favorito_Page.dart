import 'dart:io';

import 'package:appprova/src/helpers/Http/http_helper.dart';
import 'package:appprova/src/models/previsao_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritoPage extends StatefulWidget {
  @override
  State<FavoritoPage> createState() => _FavoritoPage();
  late final NasaPost? nasaPost;
}

class _FavoritoPage extends State<FavoritoPage> {
  late String result;
  late HttpHelper httphelper;

  List<NasaPost> nasaPost = [];

  @override
  void initState() {
    httphelper = new HttpHelper();

    initialize();
    super.initState();
  }
/*
  Future carregaLista() async {
    setState(() async{
      nasaPost = nasaPost;
    });
  }*/

  Future initialize() async {
    nasaPost = await httphelper.getPost();
    setState(() {
      nasaPost = nasaPost;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APOD Nasa"),
      ),
      body: ListView.builder(
          itemCount: nasaPost.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                style: ListTileStyle.list,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(nasaPost[index].url.toString()),
                ),
                title: Text('Titulo: ' + nasaPost[index].title));
          }),
    );
  }
}
