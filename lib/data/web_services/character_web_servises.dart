import 'package:breaking_char/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/character_model.dart';

class CharacterWebService {
  late Dio dio;

  CharacterWebService(){
    // to time connection
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout:  const Duration(milliseconds: 5000),
      receiveTimeout:  const Duration(milliseconds: 5000),
    );
    dio = Dio(options);
  }

  Future<List<CharacterModel>> getAllCharacters() async {
    try {
      Response response = await dio.get('/character');
      if (kDebugMode) {
        print(response.data.toString());
      }
      // Assuming that response.data is a list of characters
      List<CharacterModel> characters = (response.data as List)
          .map((characterJson) => CharacterModel.fromJson(characterJson))
          .toList();

      return characters;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

}