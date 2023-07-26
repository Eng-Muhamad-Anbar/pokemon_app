import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/card_of_pokemon.dart';
import 'pokemons_controller.dart';

class PokemonsView extends GetView<PokemonsController> {
  const PokemonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pokemons"),
        ),
        body: _pokemonsWidget(context));
  }

  Widget _pokemonsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GetBuilder<PokemonsController>(
          id: "pokemonsList",
          builder: (_) {
            switch (controller.widgetState) {
              case WidgetState.loading:
                return const Center(child: CircularProgressIndicator());
              case WidgetState.error:
                return Center(
                  child: ElevatedButton(
                      onPressed: controller.getPokemons,
                      child: const Text("Please Try Again")),
                );
              default:
                return NotificationListener(
                  onNotification: (t) {
                    if (t is ScrollEndNotification) {
                      if (controller.scrollController.position.pixels ==
                          controller
                              .scrollController.position.maxScrollExtent) {
                        controller.pokemonsPagination();
                      }
                    }

                    return true;
                  },
                  child: ListView.separated(
                      controller: controller.scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == controller.pokemons.length) {
                          if (controller.widgetState ==
                              WidgetState.loadingMore) {
                            return const Center(
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator()),
                            );
                          } else {
                            return const Center(
                                child: SizedBox(
                              height: 30,
                              width: 30,
                            ));
                          }
                        } else {
                          return CardOfPokemon(
                              pokemon: controller.pokemons[index]);
                        }
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: controller.pokemons.length + 1),
                );
            }
          }),
    );
  }
}
