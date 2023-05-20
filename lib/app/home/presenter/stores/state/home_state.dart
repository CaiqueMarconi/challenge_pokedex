import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';

class HomeState {
  final List<PokemonUrlEntity> listPokemonUrl;
  final List<PokemonDataEntity> listPokemonData;
  HomeState({
    required this.listPokemonUrl,
    required this.listPokemonData,
  });

  factory HomeState.init() => HomeState(
        listPokemonUrl: [],
        listPokemonData: [],
      );

  HomeState copyWith({
    List<PokemonUrlEntity>? listPokemonUrl,
    List<PokemonDataEntity>? listPokemonData,
  }) {
    return HomeState(
      listPokemonUrl: listPokemonUrl ?? this.listPokemonUrl,
      listPokemonData: listPokemonData ?? this.listPokemonData,
    );
  }
}
