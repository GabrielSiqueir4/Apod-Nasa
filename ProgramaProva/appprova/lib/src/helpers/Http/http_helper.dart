// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'dart:io';
import 'package:appprova/src/models/previsao_model.dart';
import 'package:http/http.dart' as http;
//https://api.nasa.gov/planetary/apod?api_key=mcBR6W9VTPUVkYcPHRRIsH2XuLafnSCVRmUy84TO

class HttpHelper {
  Future<List<NasaPost>> getPost() async {
    /*Uri uri = new Uri(
        scheme: 'https',
        host: 'api.nasa.gov',
        path: 'planetary/apod',
        queryParameters: {
          'api_key': 'mcBR6W9VTPUVkYcPHRRIsH2XuLafnSCVRmUy84TO',
        });*/

    Uri uri = new Uri(
        scheme: 'https',
        host: 'www.google.com.br',
      

    );


    print('é aqui');
    print(uri);

    http.Response response = await http.get(uri);
    print(response);
    print('teste metodo http');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      final nasaPost = NasaPost.fromJson(json);

      List<NasaPost> nasa = [];
      nasa.add(nasaPost);

      return nasa;
    } else {
      return [];
    }
  }
  /* NasaPost post = NasaPost.fromJson(json);

  List<NasaPost> nasaPosts = []; 

  nasaPosts.add(post);*/
}
