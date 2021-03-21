import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movies/src/models/pelicula_model.dart';
import 'package:movies/src/models/actores_model.dart';
import 'package:movies/src/models/people_model.dart';

class PeliculasProvider{
  String _apiKey = '8b00674737e566ceeb653494a398df38';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStream(){
    _popularesStreamController?.close();
  }


  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    //print(decodedData['results']);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    //print(peliculas.items[1].title);

    return peliculas.items;

  }

  Future<List<Pelicula>> getEnCines() async{
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key'  : _apiKey,
      'language' : _language
    });

    return await _procesarRespuesta(url);

  }

   Future<List<Pelicula>> getCinePopular() async {
     if(_cargando) return [];
     _cargando = true;
      print('Cargando data');
     _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'  : _apiKey,
      'language' : _language,
      'page'     : _popularesPage.toString(),
    });

    final resp = await _procesarRespuesta(url);
    _populares.addAll(resp);
    popularesSink(_populares);

    _cargando = false;
    return resp;
  }


  Future<List<Actor>> getCast(String peliId) async {
    final url = Uri.https(_url, '3/movie/$peliId/credits',{
      'api_key'  : _apiKey,
      'language' : _language
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cast = new Cast.fromJsonList(decodedData['cast']);
    return cast.actores;

  }


  Future<Person> getPerson(String personId) async{
    final url = Uri.https(_url, '3/person/$personId',{
      'api_key'  : _apiKey,
      'language' : _language
    });
    print('Aqui ---> $url');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final person = new Person.fromJsonMap(decodedData);
    //final people = new People.fromJsonList(decodedData);

    return person;
  }

}