import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:appprova/src/models/previsao_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//https://api.nasa.gov/planetary/apod?api_key=mcBR6W9VTPUVkYcPHRRIsH2XuLafnSCVRmUy84TO

import 'dart:convert';
import 'package:http/http.dart';

class HttpHelper {
  Future<List<Nasa>> getTempo() async {
    Uri uri = Uri(
        scheme: 'https',
        host: 'https://api.nasa.gov',
        path: '/planetary/apod',
        queryParameters: {
          'key': ['SdgQYmPU1iJ92Ld6dXCJgG4Wr656xCSdNmHKJbg9'],
          'date': ['date']
        });

    http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      final nasaMap = json['results'] as List;

      List<Nasa> nasa = nasaMap.map((data) => Nasa.fromJson(data)).toList();

      return nasa;
    } else {
      return [];
    }
  }

  Future<List<Nasa>> buscaMedia(String titulo) async {
    print(titulo);
    // ignore: unnecessary_new
    Uri uri = new Uri(
        scheme: 'https',
        host: 'https://api.nasa.gov',
        path: '/search',
        queryParameters: {
          'key': ['SdgQYmPU1iJ92Ld6dXCJgG4Wr656xCSdNmHKJbg9'],
          'date': ['date']
        });
    http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      final nasaMap = json['results'] as List;

      List<Nasa> nasa = nasaMap.map((data) => Nasa.fromJson(data)).toList();

      return nasa;
    } else {
      return [];
    }
  }
}
