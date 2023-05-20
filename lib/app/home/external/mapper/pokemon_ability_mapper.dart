import 'package:challenge_pokedex/app/home/domain/entities/pokemon_ability_entity.dart';

class PokemonAbilityMapper {
  static PokemonAbilityEntity fromMap(Map<String, dynamic> map) {
    return PokemonAbilityEntity(abilityPokemon: map['ability']['name']);
  }
}
