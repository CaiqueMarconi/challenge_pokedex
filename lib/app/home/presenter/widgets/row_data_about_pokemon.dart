import 'package:challenge_pokedex/app/core/shared/helpers/convert_string_to_capitalization.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/colors/string_colors.dart';
import '../../../core/themes/images/string_images.dart';
import '../../domain/entities/pokemon_data_entity.dart';
import 'column_about_stats_pokemon.dart';
import 'divider_stats.dart';

class RowDataAboutPokemon extends StatelessWidget {
  final PokemonDataEntity pokemon;
  const RowDataAboutPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColumnAboutStatsPokemon(
            value: '${(pokemon.weight * 0.1).toStringAsFixed(1)} kg',
            icon: StringImages.weightIcon,
            title: 'Weight',
          ),
          SizedBox(width: size.width * 0.050),
          const DividerStats(),
          SizedBox(width: size.width * 0.050),
          ColumnAboutStatsPokemon(
            value: '${(pokemon.height * 0.1).toStringAsFixed(1)} m',
            icon: StringImages.heightIcon,
            title: 'Height',
          ),
          SizedBox(width: size.width * 0.050),
          const DividerStats(),
          SizedBox(width: size.width * 0.050),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  pokemon.abilities.length,
                  (index) => Text(
                    pokemon.abilities[index].abilityPokemon.capitalize(),
                  ),
                ),
              ),
              Text(
                'Moves',
                style: TextStyle(
                  color: StringColors.greySteel,
                  fontSize: size.width * 0.040,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
