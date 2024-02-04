import 'package:breaking_char/constants/strings.dart';
import 'package:breaking_char/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/characters_details.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharRoute.charactersScreen:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());
      case CharRoute.charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharactersDetailsScreen());
    }
    return null;
  }
}
