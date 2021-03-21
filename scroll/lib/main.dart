import 'package:flutter/material.dart';

void main() => runApp(ScrollView());

class ScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hola',
      home: Material(
        child: new Container(
            child: new SingleChildScrollView(
                child: new ConstrainedBox(
      constraints: new BoxConstraints(),
      child: new Column(children: <Widget>[
        new Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/7/77/Gfp-mexico-boquillas-del-carmen-landscape-of-the-rio-grande.jpg',
        ),
        new Container(
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
          color: Colors.grey,
          child: new Text(
            'Cast Light life style Here',
            textDirection: TextDirection.ltr,
            style: new TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        new Container(
          child: new Text(
            'Hi There ? this is sample plaid app using flutter sdk and dart programming language, devceloper is Hammad Tariq'
                'this is sample Flutter app example Code'
                'Flutter Column Widget scrollable using SingleChildScrollView'
                'I am just loving Flutter SDK'
                'Flutter scrollview example using Single Child Scroll View'
                'flutter fixing bottom overflow by xx pixels in flutter'
                'Flutter scrollable layout example'
                'Flutter app SingleChildScrollView Example '
				'Hi There ? this is sample plaid app using flutter sdk and dart programming language, devceloper is Hammad Tariq'
                'this is sample Flutter app example Code'
                'Flutter Column Widget scrollable using SingleChildScrollView'
                'I am just loving Flutter SDK'
                'Flutter scrollview example using Single Child Scroll View'
                'flutter fixing bottom overflow by xx pixels in flutter'
                'Flutter scrollable layout example'
                'Flutter app SingleChildScrollView Example '
				'Hi There ? this is sample plaid app using flutter sdk and dart programming language, devceloper is Hammad Tariq'
                'this is sample Flutter app example Code'
                'Flutter Column Widget scrollable using SingleChildScrollView'
                'I am just loving Flutter SDK'
                'Flutter scrollview example using Single Child Scroll View'
                'flutter fixing bottom overflow by xx pixels in flutter'
                'Flutter scrollable layout example'
                'Flutter app SingleChildScrollView Example '
				'Hi There ? this is sample plaid app using flutter sdk and dart programming language, devceloper is Hammad Tariq'
                'this is sample Flutter app example Code'
                'Flutter Column Widget scrollable using SingleChildScrollView'
                'I am just loving Flutter SDK'
                'Flutter scrollview example using Single Child Scroll View'
                'flutter fixing bottom overflow by xx pixels in flutter'
                'Flutter scrollable layout example'
                'Flutter app SingleChildScrollView Example ',
            textDirection: TextDirection.ltr,
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
        )
      ]),
    ))))
    );
  }
}


