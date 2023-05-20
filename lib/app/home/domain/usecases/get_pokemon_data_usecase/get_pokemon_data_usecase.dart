import 'package:dartz/dartz.dart';

import '../../../../core/shared/failure/app_exception/i_app_exception.dart';
import '../../entities/pokemon_data_entity.dart';
import '../../entities/pokemon_url_entity.dart';
import '../../repositories/i_get_pokemon_data_repository.dart';
import 'i_get_pokemon_data_usecase.dart';

class GetPokemonDataUsecase implements IGetPokemonDataUsecase {
  final IGetPokemonDataRepository _repository;

  const GetPokemonDataUsecase(this._repository);
  @override
  Future<Either<IAppException, List<PokemonDataEntity>>> call(
      List<PokemonUrlEntity> param) async {
    List<PokemonDataEntity> listDataPokemon = [];
    for (var i = 0; i < param.length; i++) {
      final result = await _repository.call(param[i]);
      final response = result.fold(id, id);
      if (response is IAppException) return Left(response);
      if (response is PokemonDataEntity) listDataPokemon.add(response);
    }
    return Right(listDataPokemon);
  }
}
