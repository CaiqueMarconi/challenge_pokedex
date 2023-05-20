import 'package:challenge_pokedex/app/core/shared/http/helpers/params.dart';
import 'package:challenge_pokedex/app/core/shared/http/i_http_service.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/string_endpoint.dart';
import 'package:challenge_pokedex/app/home/external/mapper/pokemon_url_mapper.dart';
import 'package:challenge_pokedex/app/home/infra/datasources/i_get_pokemon_url_datasource.dart';

class GetPokemonUrlDatasource implements IGetPokemonUrlDatasource {
  final IHttpService _httpService;

  GetPokemonUrlDatasource(IHttpService httpService)
      : _httpService = httpService;

  @override
  Future<List<PokemonUrlEntity>> call() async {
    final httpResponse = await _httpService.get(
      const GetHttpServiceParam(url: StringEndpoint.endpointPokemon),
    );
    final resultList = List.from(httpResponse.data['results']);
    final result = resultList.map((e) => PokemonUrlMapper.fromMap(e)).toList();
    return result;
  }
}
