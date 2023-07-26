import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/models/pokemon_model.dart';
import '../../core/repo/pokemon_repo.dart';
import '../../core/services/error_handler.dart';

class PokemonsController extends GetxController {
  PokemonRepo pokemonRepo;
  WidgetState widgetState = WidgetState.loading;
  PokemonsController({required this.pokemonRepo});
  List<Pokemon> pokemons = [];
  ScrollController scrollController = ScrollController();
  int offset = 0;
  Future<void> getPokemons([bool isLoadingMore = false]) async {
    try {
      if (isLoadingMore) {
        widgetState = WidgetState.loadingMore;
      } else {
        widgetState = WidgetState.loading;
      }
      log(widgetState.toString());
      update(["pokemonsList"]);
      List<Pokemon> tempPokemons = await pokemonRepo.getPokemonsFromApi(offset);
      if (tempPokemons.isEmpty) {
        widgetState = WidgetState.noMoreData;
        BotToast.showText(text: "No More Data");
      }
      pokemons.addAll(tempPokemons);
      widgetState = WidgetState.done;
      offset++; //increase offset only when the request succeeds
    } on ExceptionHandler catch (e) {
      if (isLoadingMore) {
        widgetState = WidgetState.done;
      } else {
        widgetState = WidgetState.error;
      }

      BotToast.showText(text: e.error);
    }
    // log(widgetState.toString());
    update(["pokemonsList"]);
  }

  void pokemonsPagination() {
    /*this condition is to avoid useless requests &&
   to avoid sending requests when we have got all pokemons from API*/
    if (widgetState != WidgetState.loadingMore &&
        widgetState != WidgetState.noMoreData) {
      getPokemons(true);
    }
  }

  @override
  void onInit() {
    getPokemons();
    super.onInit();
  }
}

enum WidgetState { loading, error, done, loadingMore, noMoreData }
