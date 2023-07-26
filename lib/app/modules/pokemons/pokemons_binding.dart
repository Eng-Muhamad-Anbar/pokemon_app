import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../core/repo/pokemon_repo.dart';
import 'pokemons_controller.dart';

class PokemonsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio(BaseOptions(
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5))));
    Get.put(PokemonRepo(dio: Get.find<Dio>()));
    Get.put(PokemonsController(pokemonRepo: Get.find<PokemonRepo>()));
  }
}
