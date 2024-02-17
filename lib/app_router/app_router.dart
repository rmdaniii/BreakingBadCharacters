import 'package:breaking_char/business/cubit/characters_cubit.dart';
import 'package:breaking_char/constants/strings.dart';
import 'package:breaking_char/data/models/character_model.dart';
import 'package:breaking_char/data/respository/repo_characters.dart';
import 'package:breaking_char/data/web_services/character_web_servises.dart';
import 'package:breaking_char/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/screens/characters_details.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepo = CharactersRepo(CharacterWebService());
    charactersCubit = CharactersCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharRoute.charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
            charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case CharRoute.charactersDetailsScreen:
        final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(
            builder: (_) =>  CharactersDetailsScreen(character: character,));
    }
    return null;
  }
}
