import 'package:challenge_pokedex/app/core/shared/helpers/convert_string_to_capitalization.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/colors/string_colors.dart';
import '../../domain/entities/pokemon_data_entity.dart';
import '../../domain/helpers/enums/enum_type_pokemon.dart';

class RowTypesPokemon extends StatelessWidget {
  final PokemonDataEntity pokemon;
  const RowTypesPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          pokemon.typePokemon.length,
          (index) => Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.040,
            ),
            padding: EdgeInsets.symmetric(
              vertical: size.width * 0.020,
              horizontal: size.width * 0.040,
            ),
            decoration: BoxDecoration(
              color: EnumTypePokemonExtension.colorThemePokemonType(
                pokemon.typePokemon[index].typePokemon,
              ),
              borderRadius: BorderRadius.circular(
                size.width * 0.060,
              ),
            ),
            child: Text(
              pokemon.typePokemon[index].typePokemon.name.capitalize(),
              style: TextStyle(
                color: StringColors.white,
                fontSize: size.width * 0.050,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
