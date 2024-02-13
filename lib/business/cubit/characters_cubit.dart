import 'package:bloc/bloc.dart';
import 'package:breaking_char/data/models/character_model.dart';
import 'package:meta/meta.dart';

import '../../data/respository/repo_characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  List<CharacterModel> characters = [];
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    charactersRepo.getAllCharacters().then((character){
      // start to state from the stateCubit
      emit(CharactersLoaded(character));
      characters = character;
    });

    return characters;

}


}
