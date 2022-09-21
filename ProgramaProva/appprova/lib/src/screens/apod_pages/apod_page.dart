// ignore_for_file: prefer_const_constructors

import 'package:appprova/src/helpers/Http/http_helper.dart';
import 'package:appprova/src/models/previsao_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ApodPage extends StatefulWidget {
  const ApodPage({Key? key}) : super(key: key);

  @override
  State<ApodPage> createState() => _ApodPageState();
}

class _ApodPageState extends State<ApodPage> {
  late HttpHelper httphelper;

  List<NasaPost> nasaPost = [];

  @override
  void initState() {
    httphelper = new HttpHelper();

    initialize();
    super.initState();
  }

  Future carregaLista() async {
    setState(() {
      nasaPost = nasaPost;
    });
  }

  Future initialize() async {
    nasaPost = await httphelper.getPost();
    setState(() {
      nasaPost = nasaPost;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*carregaLista();
    nasaPost.forEach((post) {
      print(post.url + 'erro aqui');
    });*/
    print('linha 51 mais nasa post');
    print(nasaPost);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                IconButton(
                  onPressed: () async {
                    DateTime? dia = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    /*
                          if (dia != null) {
                            chamado.dia = dia;
                          }  */
                  },
                  icon: Icon(Icons.calendar_month),
                ),
                Text(
                  'Apod Nasa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // passar o parametro para atualizar a pagina
                  },
                  icon: Icon(Icons.autorenew),
                ),
              ],
            ),
            Card(
              elevation: 16.0,

              //margin: EdgeInsets.all(12.0),
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),

              child: Container(
                width: 350,
                child: 
                //CircularProgressIndicator()
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Image.network(nasaPost[0].url),
                ),
              ),
              
            ),
            SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Nasa APOD',
                  children: <Widget>[
                    Text('Data:  ' + nasaPost[0].date),
                    SizedBox(height: 15),
                    Text('Titulo:  ' + nasaPost[0].title),
                    SizedBox(height: 15),
                    Text('Descrição da APOD :  '),
                    SizedBox(height: 10),
                    Text(nasaPost[0].explanation)
                  ],
                );
              },
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
                  primary: Color.fromARGB(255, 68, 79, 200)),
              icon: Icon(Icons.description),
              label: Text('Descrição'),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
                  primary: Color.fromARGB(255, 68, 79, 200)),
              icon: Icon(Icons.star),
              label: Text('Adicionar aos Favoritos'),
            ),
          ],
        ),
      ),
    );
  }
}
