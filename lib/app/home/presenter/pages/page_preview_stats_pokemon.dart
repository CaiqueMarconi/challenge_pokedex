import 'package:challenge_pokedex/app/core/shared/helpers/convert_string_to_capitalization.dart';
import 'package:challenge_pokedex/app/core/themes/colors/string_colors.dart';
import 'package:challenge_pokedex/app/core/themes/images/string_images.dart';
import 'package:challenge_pokedex/app/home/domain/entities/pokemon_data_entity.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/enums/enum_type_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/column_about_stats_pokemon.dart';
import '../widgets/divider_stats.dart';
import '../widgets/status_bar_custom_stats_pokemon.dart';
import '../widgets/text_stats_info.dart';
import '../widgets/text_value_stats_pokemon.dart';

class PagePreviewStatsPokemon extends StatelessWidget {
  final PokemonDataEntity pokemon;
  const PagePreviewStatsPokemon({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: EnumTypePokemonExtension.colorThemePokemonType(
        pokemon.typePokemon[0].typePokemon,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: EnumTypePokemonExtension.colorThemePokemonType(
            pokemon.typePokemon[0].typePokemon,
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: size.width * 0.040, left: size.width * 0.060),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Modular.to.pop(),
                          child: Icon(
                            Icons.arrow_back_sharp,
                            size: size.width * 0.1,
                            color: StringColors.white,
                          ),
                        ),
                        SizedBox(width: size.width * 0.030),
                        Text(
                          pokemon.name,
                          style: TextStyle(
                            fontSize: size.width * 0.080,
                            fontWeight: FontWeight.w700,
                            color: StringColors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}',
                      style: TextStyle(
                        color: StringColors.white,
                        fontSize: size.width * 0.050,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.030),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Opacity(
                        opacity: 0.2,
                        child: SvgPicture.asset(
                          StringImages.transparentPokeball,
                          height: size.width * 0.6,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.014),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: StringColors.white,
                        borderRadius: BorderRadius.circular(size.width * 0.030),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: const Offset(
                              0,
                              1,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(
                        size.width * 0.030,
                        size.width * 0.060,
                        size.width * 0.030,
                        size.width * 0.010,
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.018),
                    ),
                  ),
                  SizedBox(height: size.height * 0.012),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: size.height * 0.89,
                  child: Column(
                    children: [
                      Image.network(
                        pokemon.img,
                        scale: 1.8,
                      ),
                      Expanded(
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
                                color: EnumTypePokemonExtension
                                    .colorThemePokemonType(
                                  pokemon.typePokemon[index].typePokemon,
                                ),
                                borderRadius: BorderRadius.circular(
                                  size.width * 0.060,
                                ),
                              ),
                              child: Text(
                                pokemon.typePokemon[index].typePokemon.name
                                    .capitalize(),
                                style: TextStyle(
                                  color: StringColors.white,
                                  fontSize: size.width * 0.050,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.018),
                      Expanded(
                        child: Text(
                          'About',
                          style: TextStyle(
                            color:
                                EnumTypePokemonExtension.colorThemePokemonType(
                              pokemon.typePokemon[0].typePokemon,
                            ),
                            fontSize: size.width * 0.062,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.018),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ColumnAboutStatsPokemon(
                              value:
                                  '${(pokemon.weight * 0.1).toStringAsFixed(1)} kg',
                              icon: StringImages.weightIcon,
                              title: 'Weight',
                            ),
                            SizedBox(width: size.width * 0.050),
                            const DividerStats(),
                            SizedBox(width: size.width * 0.050),
                            ColumnAboutStatsPokemon(
                              value:
                                  '${(pokemon.height * 0.1).toStringAsFixed(1)} m',
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
                                      pokemon.abilities[index].abilityPokemon
                                          .capitalize(),
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
                      ),
                      SizedBox(height: size.height * 0.026),
                      Text(
                        'Base Stats',
                        style: TextStyle(
                          color: EnumTypePokemonExtension.colorThemePokemonType(
                            pokemon.typePokemon[0].typePokemon,
                          ),
                          fontSize: size.width * 0.062,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: size.height * 0.026),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.020),
                          child: SizedBox(
                            height: size.height * 0.19,
                            width: size.width * 0.86,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextStatsInfo(
                                        pokemon: pokemon,
                                        title: 'HP',
                                      ),
                                      TextStatsInfo(
                                        pokemon: pokemon,
                                        title: 'ATK',
                                      ),
                                      TextStatsInfo(
                                        pokemon: pokemon,
                                        title: 'DEF',
                                      ),
                                      TextStatsInfo(
                                        pokemon: pokemon,
                                        title: 'SATK',
                                      ),
                                      TextStatsInfo(
                                        pokemon: pokemon,
                                        title: 'SDEF',
                                      ),
                                      TextStatsInfo(
                                        pokemon: pokemon,
                                        title: 'SPD',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: size.width * 0.030),
                                const DividerStats(),
                                SizedBox(width: size.width * 0.030),
                                Expanded(
                                  flex: 6,
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TextValueStatsPokemon(
                                            value: pokemon.hp.toString(),
                                          ),
                                          TextValueStatsPokemon(
                                            value: pokemon.attack.toString(),
                                          ),
                                          TextValueStatsPokemon(
                                            value: pokemon.defense.toString(),
                                          ),
                                          TextValueStatsPokemon(
                                            value: pokemon.specialAttack
                                                .toString(),
                                          ),
                                          TextValueStatsPokemon(
                                            value: pokemon.specialDefense
                                                .toString(),
                                          ),
                                          TextValueStatsPokemon(
                                            value: pokemon.speed.toString(),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: size.width * 0.020),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            StatusBarCustomStatsPokemon(
                                              pokemon: pokemon,
                                              valueStats: pokemon.hp,
                                            ),
                                            StatusBarCustomStatsPokemon(
                                              pokemon: pokemon,
                                              valueStats: pokemon.attack,
                                            ),
                                            StatusBarCustomStatsPokemon(
                                              pokemon: pokemon,
                                              valueStats: pokemon.defense,
                                            ),
                                            StatusBarCustomStatsPokemon(
                                              pokemon: pokemon,
                                              valueStats: pokemon.specialAttack,
                                            ),
                                            StatusBarCustomStatsPokemon(
                                              pokemon: pokemon,
                                              valueStats:
                                                  pokemon.specialDefense,
                                            ),
                                            StatusBarCustomStatsPokemon(
                                              pokemon: pokemon,
                                              valueStats: pokemon.speed,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
