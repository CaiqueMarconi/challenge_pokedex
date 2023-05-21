import 'package:flutter/material.dart';

import '../../domain/entities/pokemon_data_entity.dart';
import '../../domain/helpers/enums/enum_type_pokemon.dart';

class TextStatsInfo extends StatelessWidget {
  final String title;
  final PokemonDataEntity pokemon;
  const TextStatsInfo({
    Key? key,
    required this.title,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        color: EnumTypePokemonExtension.colorThemePokemonType(
          pokemon.typePokemon[0].typePokemon,
        ),
        fontSize: size.width * 0.040,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
