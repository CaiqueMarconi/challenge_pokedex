import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/params/get_pokemon_url_param.dart';

class HomeState {
  final List<PokemonUrlEntity> listPokemonUrl;
  final List<PokemonDataEntity> listPokemonData;
  final GetPokemonUrlParam endpointPokemons;
  final bool updateList;
  HomeState({
    required this.listPokemonUrl,
    required this.listPokemonData,
    required this.endpointPokemons,
    required this.updateList,
  });

  factory HomeState.init() => HomeState(
        listPokemonUrl: [],
        listPokemonData: [],
        endpointPokemons: GetPokemonUrlParam(''),
        updateList: false,
      );

  HomeState copyWith({
    List<PokemonUrlEntity>? listPokemonUrl,
    List<PokemonDataEntity>? listPokemonData,
    GetPokemonUrlParam? endpointPokemons,
    bool? updateList,
  }) {
    return HomeState(
      listPokemonUrl: listPokemonUrl ?? this.listPokemonUrl,
      listPokemonData: listPokemonData ?? this.listPokemonData,
      endpointPokemons: endpointPokemons ?? this.endpointPokemons,
      updateList: updateList ?? this.updateList,
    );
  }
}
