import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';

class PokemonDataMapper {
  static PokemonDataEntity fromMap(Map<String, dynamic> map) {
    return PokemonDataEntity(
      id: map['id'],
      name: map['name'],
      img: map['sprites']['other']['official-artwork']['front_default'],
      hp: map['stats'][0]['base_stat'],
      attack: map['stats'][1]['base_stat'],
      defense: map['stats'][2]['base_stat'],
      specialAttack: map['stats'][3]['base_stat'],
      specialDefense: map['stats'][4]['base_stat'],
      speed: map['stats'][5]['base_stat'],
    );
  }
}
