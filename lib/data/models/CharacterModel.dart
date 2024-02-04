
import 'dart:ffi';

/// id : 2
/// name : "Morty Smith"
/// status : "Alive"
/// species : "Human"
/// type : ""
/// gender : "Male"
/// origin : {"name":"Earth";"url":"https://rickandmortyapi.com/api/location/1"}
/// location : {"name":"Earth";"url":"https://rickandmortyapi.com/api/location/20"}
/// image : "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
/// episode : ["https://rickandmortyapi.com/api/episode/1";"https://rickandmortyapi.com/api/episode/2";null]
/// url : "https://rickandmortyapi.com/api/character/2"
/// created : "2017-11-04T18:50:21.651Z"

class CharacterModel {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  List<dynamic> origin;
  List<dynamic> location;
  String image;
  List<String> episode;
  String url;
  String created;

  CharacterModel.from
}

class Location {
}

class Origin {
}
