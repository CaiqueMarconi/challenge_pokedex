import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/shared/failure/app_exception/i_app_exception.dart';
import '../entities/pokemon_url_entity.dart';

abstract class IGetPokemonDataRepository {
  Future<Either<IAppException, PokemonDataEntity>> call(PokemonUrlEntity param);
}
