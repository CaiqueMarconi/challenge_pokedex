import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';
import 'package:challenge_pokedex/app/core/shared/failure/app_exception/i_app_exception.dart';
import 'package:challenge_pokedex/app/home/domain/repositories/i_get_pokemon_data_repository.dart';
import 'package:challenge_pokedex/app/home/infra/datasources/i_get_pokemon_data_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/pokemon_url_entity.dart';

class GetPokemonDataRepository implements IGetPokemonDataRepository {
  final IGetPokemonDataDatasource _dataDatasource;

  const GetPokemonDataRepository(this._dataDatasource);

  @override
  Future<Either<IAppException, PokemonDataEntity>> call(
      PokemonUrlEntity param) async {
    try {
      final result = await _dataDatasource.call(param);
      return Right(result);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
