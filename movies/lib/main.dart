import 'package:flutter/material.dart';
import 'package:movies/src/pages/actor_detalle.dart';

import 'package:movies/src/pages/home_page.dart';
import 'package:movies/src/pages/pelicula_detalle.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Movies',
      initialRoute: '/',
      routes: {
        '/'             : (BuildContext context) => HomePage(),
        'detalle'       : (BuildContext context) => PeliculaDetalle(),
        'detalleActor'  : (BuildContext context) => ActorDetalle(),
      },
    );
  }
}