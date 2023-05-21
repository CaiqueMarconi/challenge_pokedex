import 'package:challenge_pokedex/app/core/shared/services/http/helpers/params.dart';
import 'package:challenge_pokedex/app/core/shared/services/http/helpers/responses.dart';
import 'package:challenge_pokedex/app/core/shared/services/http/i_http_service.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/params/get_pokemon_url_param.dart';
import 'package:challenge_pokedex/app/home/external/datasources/get_pokemon_url_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHttp extends Mock implements IHttpService {}

class GetHttpParamFake extends Fake implements GetHttpServiceParam {}

void main() {
  final http = MockHttp();
  final datasource = GetPokemonUrlDatasource(http);

  setUp(() {
    registerFallbackValue(GetHttpParamFake());
  });

  const mock = GetHttpServiceResponse(data: {
    "count": 1281,
    "next": "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20",
    "previous": null,
    "results": [
      {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"},
    ],
  });
  test('get pokemon url datasource ...', () async {
    when(
      () => http.get(
        any(),
      ),
    ).thenAnswer((invocation) async => mock);
    final result = await datasource.call(GetPokemonUrlParam(''));
    expect(result, isA<List<PokemonUrlEntity>>());
  });
}
