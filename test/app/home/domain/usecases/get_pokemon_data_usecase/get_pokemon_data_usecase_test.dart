import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:challenge_pokedex/app/home/domain/repositories/i_get_pokemon_data_repository.dart';
import 'package:challenge_pokedex/app/home/domain/usecases/get_pokemon_data_usecase/get_pokemon_data_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/pokemon_data_entity_mock.dart';

class RepositoryMock extends Mock implements IGetPokemonDataRepository {}

void main() {
  final repository = RepositoryMock();
  final usecase = GetPokemonDataUsecase(repository);

  final mockParam = PokemonUrlEntity(urlPokemon: '');
  test('get pokemon data usecase ...', () async {
    when(() => repository.call(mockParam))
        .thenAnswer((invocation) async => Right(pokemonDataEntityMock));
    final result = await usecase.call([mockParam]);
    expect(result.fold((l) => l, (r) => r), isA<List<PokemonDataEntity>>());
  });
}
