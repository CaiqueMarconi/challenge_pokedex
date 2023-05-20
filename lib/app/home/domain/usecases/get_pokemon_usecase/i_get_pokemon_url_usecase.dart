import 'package:dartz/dartz.dart';

import '../../../../core/shared/failure/app_exception/i_app_exception.dart';
import '../../entities/pokemon_url_entity.dart';
import '../../helpers/params/get_pokemon_url_param.dart';

abstract class IGetPokemonUrlUsecase {
  Future<Either<IAppException, List<PokemonUrlEntity>>> call(
      GetPokemonUrlParam param);
}
