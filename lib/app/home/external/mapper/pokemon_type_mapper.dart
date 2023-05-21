import 'package:challenge_pokedex/app/home/domain/entities/pokemon_type_entity.dart';

import '../../domain/helpers/enums/enum_type_pokemon.dart';

class PokemonTypeMapper {
  static PokemonTypeEntity fromMap(Map<String, dynamic> map) {
    return PokemonTypeEntity(
      typePokemon:
          EnumTypePokemonExtension.convertStringToEnum(map['type']['name']),
    );
  }
}
