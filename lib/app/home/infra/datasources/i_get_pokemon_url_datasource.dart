import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';

import '../../domain/helpers/params/get_pokemon_url_param.dart';

abstract class IGetPokemonUrlDatasource {
  Future<List<PokemonUrlEntity>> call(GetPokemonUrlParam param);
}
