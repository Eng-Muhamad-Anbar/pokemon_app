import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/pokemon_model.dart';
import '../services/error_handler.dart';

class PokemonRepo {
  final Dio dio;
  String baseUrl = "https://pokeapi.co";

  PokemonRepo({required this.dio});
  Future<List<Pokemon>> getPokemonsFromApi(int offset) async {
    try {
      Map<String, dynamic> queryParameters = {"offset": offset * 7, "limit": 7};
      // log(queryParameters.toString(), name: "start getting pokemons");
      Response response = await dio.get('$baseUrl/api/v2/pokemon',
          queryParameters: queryParameters);

      List pokeData = response.data["results"];
      List<Pokemon> pokemons = pokeData.asMap().entries.map<Pokemon>((element) {
        element.value["id"] = element.key + 1 + (offset * 7);
        element.value["img"] =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${element.key + 1 + (offset * 7)}.png";
        return Pokemon.fromMap(element.value);
      }).toList();
      // print(pokemons);
      return pokemons;
    } catch (e) {
      log(e.toString());
      throw ExceptionHandler("Can't get pokemons");
    }
  }
}
