import 'package:flutter/material.dart';

import '../models/pokemon_model.dart';

class CardOfPokemon extends StatelessWidget {
  CardOfPokemon({super.key, required this.pokemon});
  Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 125,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 6,
          child: Row(
            children: [
              Image.network(
                pokemon.pokeImg,
                fit: BoxFit.fill,
              ),
              Column(
                children: [
                  Text(
                    pokemon.pokeName,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
