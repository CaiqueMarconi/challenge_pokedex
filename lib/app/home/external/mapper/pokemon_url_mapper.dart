import 'package:challenge_pokedex/app/home/domain/entities/pokemon_url_entity.dart';

class PokemonUrlMapper {
  static PokemonUrlEntity fromMap(Map<String, dynamic> map) {
    return PokemonUrlEntity(
      urlPokemon: map['url'],
      name: map['name'],
    );
  }
}
