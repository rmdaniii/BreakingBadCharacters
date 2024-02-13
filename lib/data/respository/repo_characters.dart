
import 'package:breaking_char/data/models/character_model.dart';
import 'package:breaking_char/data/web_services/character_web_servises.dart';

class CharactersRepo {

  final CharacterWebService characterWebService;

  CharactersRepo(this.characterWebService);

  Future <List<CharacterModel>> getAllCharacters() async{

    final characters = await characterWebService.getAllCharacters();
    // return characters.map((character) =>
    //     CharacterModel.fromJson(character) ).toList();

    return characters;
  }
}