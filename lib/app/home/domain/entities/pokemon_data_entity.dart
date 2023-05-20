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
  });
}
