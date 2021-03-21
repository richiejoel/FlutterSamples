class People{
  List<Person> personas = new List();

  People.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    jsonList.forEach((item){
      final persona = Person.fromJsonMap(item);
      personas.add(persona);
    });
  }

}

class Person {
  String birthday;
  String knownForDepartment;
  dynamic deathday;
  int id;
  String name;
  List<String> alsoKnownAs;
  int gender;
  String biography;
  double popularity;
  String placeOfBirth;
  String profilePath;
  bool adult;
  String imdbId;
  dynamic homepage;

  Person({
    this.birthday,
    this.knownForDepartment,
    this.deathday,
    this.id,
    this.name,
    this.alsoKnownAs,
    this.gender,
    this.biography,
    this.popularity,
    this.placeOfBirth,
    this.profilePath,
    this.adult,
    this.imdbId,
    this.homepage,
  });

  Person.fromJsonMap(Map<String, dynamic> json){
    birthday            = json['birthday'];
    knownForDepartment  = json['known_for_department'];
    deathday            = json['deathday'];
    id                  = json['id'];
    name                = json['name'];
    gender              = json['gender'];
    biography           = json['biography'];
    popularity          = json['popularity'];
    placeOfBirth        = json['place_of_birth'];
    profilePath         = json['profile_path'];
  }

  getPhotoProfile(String genero){
    if(profilePath == null){
      if(genero == "1" ){
        return 'assets/img/no-image.jpg';
      } else {
        return 'assets/img/no-image.jpg';
      }
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }

}
