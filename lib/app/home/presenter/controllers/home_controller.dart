import 'package:challenge_pokedex/app/home/presenter/stores/home_store.dart';

class HomeController {
  final HomeStore homeStore;

  HomeController(this.homeStore);

  Future<void> loadDataPokemons() async {
    await homeStore.getPokemonUrl();
    await homeStore.getPokemonData();
  }
}
