import 'package:challenge_pokedex/app/core/shared/services/http/helpers/params.dart';
import 'package:challenge_pokedex/app/core/shared/services/http/helpers/responses.dart';
import 'package:challenge_pokedex/app/core/shared/services/http/i_http_service.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:challenge_pokedex/app/home/external/datasources/get_pokemon_data_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/response_get_pokemon_data_mock.dart';

class MockHttp extends Mock implements IHttpService {}

class GetHttpParamFake extends Fake implements GetHttpServiceParam {}

void main() {
  final http = MockHttp();
  final datasource = GetPokemonDataDatasource(http);

  setUp(() {
    registerFallbackValue(GetHttpParamFake());
  });

  final mockParam = PokemonUrlEntity(urlPokemon: '', name: '');
  test('get pokemon data datasource ...', () async {
    when(() => http.get(
              any(),
            ))
        .thenAnswer((invocation) async =>
            GetHttpServiceResponse(data: responseGetPokemonDataMock));
    final result = await datasource.call(mockParam);
    expect(result, isA<PokemonDataEntity>());
  });
}
