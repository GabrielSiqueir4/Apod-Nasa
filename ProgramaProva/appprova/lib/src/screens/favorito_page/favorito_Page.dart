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
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(nasaPost[index].url.toString()),
                ),
                trailing: const Text(
                  "Favoritos Page",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("List item $index"));
          }),
      /*children: nasaPost.map((NasaPost nasaPost) => ListTile(
                  title: Text(nasaPost.url),

                ))
            .toList(),*/
    );

    /*return CircularProgressIndicator();*/
  }
}
  


/*
class ApodsPage extends StatefulWidget {
  @override
  State<ApodsPage> createState() => _ApodsPageState();
}

class _ApodsPageState extends State<ApodsPage> {
  HttpHelper httpHelper = HttpHelper();

  Widget build(BuildContext context) {
     List<NasaPost>? nasaPost = [];
     nasaPost =  httpHelper.getPost();
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Apod"),
      ),
      body: FutureBuilder(builder:
          (BuildContext context, AsyncSnapshot<List<NasaPost>> snapshot) {
        if (snapshot.hasData) {
         
          return ListView(
            children: nasaPost!
                .map((NasaPost nasaPost) => ListTile(
                      title: Text(nasaPost.explanation),
                    ))
                .toList(),
          );
        }
        return CircularProgressIndicator();
      }),
    );
  }
}
*/