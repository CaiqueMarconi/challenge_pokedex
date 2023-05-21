import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/params/get_pokemon_url_param.dart';
import 'package:challenge_pokedex/app/home/domain/repositories/i_get_pokemon_url_repository.dart';
import 'package:challenge_pokedex/app/home/domain/usecases/get_pokemon_usecase/get_pokemon_url_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements IGetPokemonUrlRepository {}

void main() {
  final repository = RepositoryMock();
  final usecase = GetPokemonUrlUsecase(repository);

  final mock = GetPokemonUrlParam('');
  test('get pokemon url usecase ...', () async {
    when(() => repository.call(mock))
        .thenAnswer((invocation) async => const Right([]));
    final result = await usecase.call(mock);
    expect(result.fold((l) => l, (r) => r), isA<List<PokemonUrlEntity>>());
  });
}
