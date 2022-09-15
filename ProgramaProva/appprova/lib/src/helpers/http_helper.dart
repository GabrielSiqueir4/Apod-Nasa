import 'package:http/http.dart' as http;

class HttpHelper{
  Future<List<Previsao>> getTempo() async{
    Uri uri = Uri(
      scheme: 'https',
      host: 'https://api.hgbrasil.com/weather?key=ae1f1cfd&city_name=Toledo,PR',
     path: '', //fiquei sem saber o que colocar nesse carinha aqui 

      queryParameters: {
        'api-key': 'ae1f1cfd',
        'language': 'PT-BR'
      }


    );

    http.Response response = await http.get(uri);
  }
}