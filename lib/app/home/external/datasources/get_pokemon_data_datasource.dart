import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';
import 'package:challenge_pokedex/app/home/external/mapper/pokemon_data_mapper.dart';
import 'package:challenge_pokedex/app/home/infra/datasources/i_get_pokemon_data_datasource.dart';

import '../../../core/shared/http/helpers/params.dart';
import '../../../core/shared/http/i_http_service.dart';
import '../../domain/entities/pokemon_url_entity.dart';

class GetPokemonDataDatasource implements IGetPokemonDataDatasource {
  final IHttpService _httpService;

  GetPokemonDataDatasource(IHttpService httpService)
      : _httpService = httpService;

  @override
  Future<PokemonDataEntity> call(PokemonUrlEntity param) async {
    final httpResponse = await _httpService.get(
      GetHttpServiceParam(url: param.urlPokemon),
    );
    final resultList = httpResponse.data;
    final result = PokemonDataMapper.fromMap(resultList);
    return result;
  }
}
