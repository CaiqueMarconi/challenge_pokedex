import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:challenge_pokedex/app/core/shared/failure/app_exception/i_app_exception.dart';
import 'package:challenge_pokedex/app/home/domain/repositories/i_get_pokemon_url_repository.dart';
import 'package:challenge_pokedex/app/home/infra/datasources/i_get_pokemon_url_datasource.dart';
import 'package:dartz/dartz.dart';

class GetPokemonUrlRepository implements IGetPokemonUrlRepository {
  final IGetPokemonUrlDatasource _datasource;

  GetPokemonUrlRepository(this._datasource);

  @override
  Future<Either<IAppException, List<PokemonUrlEntity>>> call() async {
    try {
      final result = await _datasource.call();
      return Right(result);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
