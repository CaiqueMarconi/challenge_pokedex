import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/params/get_pokemon_url_param.dart';
import 'package:challenge_pokedex/app/home/presenter/stores/home_store.dart';

class HomeController {
  final HomeStore homeStore;

  HomeController(this.homeStore);

  List<PokemonDataEntity> get listPokemon => homeStore.state.listPokemonData;

  Future<void> loadDataPokemon(GetPokemonUrlParam param) async {
    await homeStore.getPokemonUrl(param);
    await homeStore.getPokemonData();
  }
}
