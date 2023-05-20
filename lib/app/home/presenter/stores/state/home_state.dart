import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/params/get_pokemon_url_param.dart';

class HomeState {
  final List<PokemonUrlEntity> listPokemonUrl;
  final List<PokemonDataEntity> listPokemonData;
  final GetPokemonUrlParam endpointPokemon;
  final bool updateList;
  HomeState({
    required this.listPokemonUrl,
    required this.listPokemonData,
    required this.endpointPokemon,
    required this.updateList,
  });

  factory HomeState.init() => HomeState(
        listPokemonUrl: [],
        listPokemonData: [],
        endpointPokemon: GetPokemonUrlParam(''),
        updateList: false,
      );

  HomeState copyWith({
    List<PokemonUrlEntity>? listPokemonUrl,
    List<PokemonDataEntity>? listPokemonData,
    GetPokemonUrlParam? endpointPokemon,
    bool? updateList,
  }) {
    return HomeState(
      listPokemonUrl: listPokemonUrl ?? this.listPokemonUrl,
      listPokemonData: listPokemonData ?? this.listPokemonData,
      endpointPokemon: endpointPokemon ?? this.endpointPokemon,
      updateList: updateList ?? this.updateList,
    );
  }
}
