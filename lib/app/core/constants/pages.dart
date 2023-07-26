import 'package:get/get.dart';

import '../../modules/animations/animations_binding.dart';
import '../../modules/animations/animations_view.dart';
import '../../modules/home/home_binding.dart';
import '../../modules/home/home_view.dart';
import '../../modules/pokemons/pokemons_binding.dart';
import '../../modules/pokemons/pokemons_view.dart';

List<GetPage> appPages = [
  GetPage(name: "/home", page: () => const HomeView(), binding: HomeBinding()),
  GetPage(
      name: "/animations",
      page: () => const AnimationsView(),
      binding: AnimationsBinding()),
  GetPage(
      name: "/pokemons",
      page: () => const PokemonsView(),
      binding: PokemonsBinding())
];
