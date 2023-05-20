import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';

abstract class IGetPokemonUrlDatasource {
  Future<List<PokemonUrlEntity>> call();
}
