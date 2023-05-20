import 'package:challenge_pokedex/app/home/domain/entities/pokemon_type_entity.dart';

class PokemonTypeMapper {
  static PokemonTypeEntity fromMap(Map<String, dynamic> map) {
    return PokemonTypeEntity(
      typePokemon: map['type']['name'],
    );
  }
}
