import 'package:dartz/dartz.dart';

import '../../../../core/shared/failure/app_exception/i_app_exception.dart';
import '../../entities/pokemon_data_entity.dart';
import '../../entities/pokemon_url_entity.dart';

abstract class IGetPokemonDataUsecase {
  Future<Either<IAppException, List<PokemonDataEntity>>> call(
    List<PokemonUrlEntity> param,
  );
}
