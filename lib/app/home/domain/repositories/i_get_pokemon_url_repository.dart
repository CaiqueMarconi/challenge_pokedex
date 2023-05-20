import 'package:challenge_pokedex/app/core/shared/failure/app_exception/i_app_exception.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IGetPokemonUrlRepository {
  Future<Either<IAppException, List<PokemonUrlEntity>>> call();
}
