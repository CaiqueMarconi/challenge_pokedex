import 'package:flutter/material.dart';

import '../../domain/entities/pokemon_data_entity.dart';
import '../../domain/helpers/enums/enum_type_pokemon.dart';

class StatusBarCustomStatsPokemon extends StatelessWidget {
  final PokemonDataEntity pokemon;
  final int valueStats;
  const StatusBarCustomStatsPokemon({
    Key? key,
    required this.pokemon,
    required this.valueStats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.008,
          decoration: BoxDecoration(
            color: EnumTypePokemonExtension.colorThemePokemonType(
              pokemon.typePokemon[0].typePokemon,
            ).withOpacity(0.3),
            borderRadius: BorderRadius.circular(
              size.width * 0.1,
            ),
          ),
        ),
        Container(
          height: size.height * 0.008,
          width: valueStats.toDouble(),
          decoration: BoxDecoration(
            color: EnumTypePokemonExtension.colorThemePokemonType(
              pokemon.typePokemon[0].typePokemon,
            ),
            borderRadius: BorderRadius.circular(
              size.width * 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
