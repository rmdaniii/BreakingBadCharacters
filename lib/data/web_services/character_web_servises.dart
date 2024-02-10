

import 'package:breaking_char/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CharacterWebService {

  late Dio dio;

  CharacterWebService(){
    // to time connection
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );


    dio = Dio(options);
  }

  Future <List<dynamic>> getAllCharacters() async{

    try{
      Response response = await dio.get('/character');
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response.data;
    }catch ( e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }

  }

}