import 'package:challenge_pokedex/app/core/shared/failure/app_exception/app_exception.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:challenge_pokedex/app/home/infra/datasources/i_get_pokemon_data_datasource.dart';
import 'package:challenge_pokedex/app/home/infra/repositories/get_pokemon_data_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/pokemon_data_entity_mock.dart';

class MockDatasource extends Mock implements IGetPokemonDataDatasource {}

void main() {
  final datasource = MockDatasource();
  final repository = GetPokemonDataRepository(datasource);

  final mockParam = PokemonUrlEntity(urlPokemon: '', name: '');
  test('get pokemon data repository ...', () async {
    when(() => datasource.call(mockParam))
        .thenAnswer((invocation) async => pokemonDataEntityMock);
    final result = await repository.call(mockParam);
    expect(result.fold((l) => l, (r) => r), isA<PokemonDataEntity>());
  });

  test('get pokemon data repository failure...', () async {
    when(() => datasource.call(mockParam)).thenThrow(
        AppException(message: 'message', stackTrace: StackTrace.empty));
    final result = await repository.call(mockParam);
    expect(result.fold((l) => l, (r) => r), isA<AppException>());
  });
}
