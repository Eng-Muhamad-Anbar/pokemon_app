class Pokemon {
  int pokeId;
  String pokeName;
  String pokeImg;
  Pokemon(
      {required this.pokeId, required this.pokeName, required this.pokeImg});

  factory Pokemon.fromMap(Map<String, dynamic> pokemonMap) {
    return Pokemon(
        pokeId: pokemonMap["id"],
        pokeName: pokemonMap["name"],
        pokeImg: pokemonMap["img"]);
  }
  Map<String, dynamic> toMap() {
    return {"id": pokeId, "name": pokeName, "img": pokeImg};
  }

  @override
  String toString() {
    return '''
    pokemonId: $pokeId,
    pokemonName: $pokeName,
    pokemonImage: $pokeImg
    ''';
  }
}
