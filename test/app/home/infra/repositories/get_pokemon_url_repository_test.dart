import 'package:challenge_pokedex/app/core/shared/failure/app_exception/app_exception.dart';
import 'package:challenge_pokedex/app/core/shared/failure/app_exception/i_app_exception.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/params/get_pokemon_url_param.dart';
import 'package:challenge_pokedex/app/home/infra/datasources/i_get_pokemon_url_datasource.dart';
import 'package:challenge_pokedex/app/home/infra/repositories/get_pokemon_url_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDatasource extends Mock implements IGetPokemonUrlDatasource {}

void main() {
  final datasource = MockDatasource();
  final repository = GetPokemonUrlRepository(datasource);

  final mock = GetPokemonUrlParam('');
  test('get pokemon url repository ...', () async {
    when(() => datasource.call(mock)).thenAnswer((invocation) async => []);
    final result = await repository.call(mock);
    expect(result.fold((l) => l, (r) => r), isA<List<PokemonUrlEntity>>());
  });

  test('get pokemon url repository failure...', () async {
    when(() => datasource.call(mock)).thenThrow(
      AppException(message: 'message', stackTrace: StackTrace.empty),
    );
    final result = await repository.call(mock);
    expect(result.fold((l) => l, (r) => r), isA<IAppException>());
  });
}
