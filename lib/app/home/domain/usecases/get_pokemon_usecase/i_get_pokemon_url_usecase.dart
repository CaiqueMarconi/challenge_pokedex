import 'package:dartz/dartz.dart';

import '../../../../core/shared/failure/app_exception/i_app_exception.dart';
import '../../entities/pokemon_url_entity.dart';

abstract class IGetPokemonUrlUsecase {
  Future<Either<IAppException, List<PokemonUrlEntity>>> call();
}
