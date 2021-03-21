import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'package:movies/src/models/actores_model.dart';
import 'package:movies/src/models/people_model.dart';
import 'package:movies/src/providers/peliculas_provider.dart';

final startColor = Color(0xFFaa7ce4);
final endColor = Color(0xFFe46792);
final titleColor = Color(0xff444444);
final textColor = Color(0xFFa9a9a9);
final shadowColor = Color(0xffe9e9f4);

    
class ActorDetalle extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final Actor actor = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 180,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [startColor, endColor])),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 20),
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          //Navigator.of(context).pop();
                          print('Presiono atars actor detalle');
                          Navigator.pop(context, false);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        'Detalle Actores',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, right: 20),
                      child: IconButton(
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: ListView(
                children: <Widget>[
                  new CardHolder(),
                  SizedBox(
                    height: 200,
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }

  

  
}

class CardHolder extends StatelessWidget {
  const CardHolder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100, right: 20, left: 20),
      height: 600,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: titleColor.withOpacity(.1),
                blurRadius: 20,
                spreadRadius: 10),
          ]),
      child: new Card(),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key key,
  }) : super(key: key);

 

  Widget _createProfilePhotoActor(Actor actor){
    final peliculasProvider = new PeliculasProvider();
    
    return FutureBuilder(
      future: peliculasProvider.getPerson(actor.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<Person> snapshot){
          if(snapshot.hasData){
            print('PERSON ACTOR PHOTO --> '+ snapshot.data.getPhotoProfile(snapshot.data.gender.toString()).toString());
            return Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: (snapshot.data.getPhotoProfile(snapshot.data.gender.toString().trim()) != null) ? NetworkImage(snapshot.data.getPhotoProfile(snapshot.data.gender.toString().trim())) : AssetImage(snapshot.data.getPhotoProfile(snapshot.data.gender.toString().trim())), 
                  fit: BoxFit.fill
                ),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                color: Colors.blueAccent.withOpacity(.2), width: 1)
              ),
            );
          } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
   
  }

  Widget _createProfileNameActor(Actor actor){
    final peliculasProvider = new PeliculasProvider();
    return FutureBuilder(
      future: peliculasProvider.getPerson(actor.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<Person> snapshot) {
        if(snapshot.hasData){
            print('PERSON ACTOR NAME --> '+ snapshot.data.name.toString());
            return Text(
              snapshot.data.name,
              style: TextStyle(
                color: titleColor,
                 fontSize: 20,
              ),
            );
          } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _createProfileBiographyActor(Actor actor){
    final peliculasProvider = new PeliculasProvider();
    return FutureBuilder(
      future: peliculasProvider.getPerson(actor.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<Person> snapshot) {
        if(snapshot.hasData){
           print('PERSON ACTOR BIOGRAPHYY --> '+ snapshot.data.biography.toString());
           return AutoSizeText(
              snapshot.data.biography.toString(),
              minFontSize: 12,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
           );
        }else{
           return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _createProfilePopularityActor(Actor actor){
    final peliculasProvider = new PeliculasProvider();
    return FutureBuilder(
      future: peliculasProvider.getPerson(actor.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<Person> snapshot) {
        if(snapshot.hasData){
           print('PERSON ACTOR POPULARITY --> '+ snapshot.data.popularity.toString());
           return Row(
             children: <Widget>[
               Icon(Icons.star_border),
               Text(
                  snapshot.data.popularity.toString(),
                  style: TextStyle(color: textColor, fontSize: 15)
                )
             ],
           );
           
        }else{
           return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _createProfileBirthdayActor(Actor actor){
    final peliculasProvider = new PeliculasProvider();
    return FutureBuilder(
      future: peliculasProvider.getPerson(actor.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<Person> snapshot) {
        if(snapshot.hasData){
            print('PERSON ACTOR BIRTHDAY --> '+ snapshot.data.birthday.toString());
            return Text(
              snapshot.data.birthday.toString(),
              style: TextStyle(
                color: textColor,
              ),
            );
          } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _createProfileKnowActor(Actor actor){
    final peliculasProvider = new PeliculasProvider();
    return FutureBuilder(
      future: peliculasProvider.getPerson(actor.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<Person> snapshot) {
        if(snapshot.hasData){
            print('PERSON ACTOR KNOW --> '+ snapshot.data.knownForDepartment.toString());
            return Text(
              snapshot.data.knownForDepartment.toString(),
              style: TextStyle(
                color: textColor,
                fontSize: 15
              ),
            );
          } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
     final Actor actor = ModalRoute.of(context).settings.arguments;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
       _createProfilePhotoActor(actor),
        SizedBox(
          height: 10,
        ),
        _createProfileNameActor(actor),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _createProfilePopularityActor(actor),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 12,
              child: VerticalDivider(
                width: 2,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            _createProfileKnowActor(actor)
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 20, right: 20, top: 8),
          width: 400,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Birthday',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      _createProfileBirthdayActor(actor)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.cake,
                                size: 15,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                Icons.local_play,
                                size: 15,
                              ),
                              onPressed: () {}),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Text(
                'Biography',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              _createProfileBiographyActor(actor)
            ],
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: Divider(
                height: 1,
                color: titleColor.withOpacity(.3),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.group_work,
                        color: textColor,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Dirbble',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    Text(
                      '.com/raazcse',
                      style: TextStyle(color: textColor, fontSize: 15),
                    )
                  ],
                ),
                Spacer(),
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.insert_emoticon,
                        color: textColor,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Behance',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    Text(
                      '.net/surjasin',
                      style: TextStyle(color: textColor, fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  width: 14,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}