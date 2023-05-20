import 'package:challenge_pokedex/app/home/domain/entities/pokemon_ability_entity.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_type_entity.dart';

class PokemonDataEntity {
  final int id;
  final String name;
  final String img;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final int weight;
  final int height;
  final List<PokemonTypeEntity> typePokemon;
  final List<PokemonAbilityEntity> abilities;
  PokemonDataEntity({
    required this.id,
    required this.name,
    required this.img,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.typePokemon,
    required this.weight,
    required this.height,
    required this.abilities,
  });
}
