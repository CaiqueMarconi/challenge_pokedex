import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:challenge_pokedex/app/core/shared/failure/app_exception/i_app_exception.dart';
import 'package:challenge_pokedex/app/home/domain/repositories/i_get_pokemon_url_repository.dart';
import 'package:challenge_pokedex/app/home/domain/usecases/get_pokemon_usecase/i_get_pokemon_url_usecase.dart';
import 'package:dartz/dartz.dart';

class GetPokemonUrlUsecase implements IGetPokemonUrlUsecase {
  final IGetPokemonUrlRepository _repository;

  const GetPokemonUrlUsecase(this._repository);
  @override
  Future<Either<IAppException, List<PokemonUrlEntity>>> call() async {
    final result = await _repository.call();
    return result;
  }
}
