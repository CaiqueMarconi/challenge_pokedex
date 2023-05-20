import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';

import '../../domain/entities/pokemon_url_entity.dart';

abstract class IGetPokemonDataDatasource {
  Future<PokemonDataEntity> call(PokemonUrlEntity param);
}
