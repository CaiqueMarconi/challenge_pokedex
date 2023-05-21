import 'package:challenge_pokedex/app/home/presenter/widgets/status_bar_custom_stats_pokemon.dart';
import 'package:challenge_pokedex/app/home/presenter/widgets/text_stats_info.dart';
import 'package:challenge_pokedex/app/home/presenter/widgets/text_value_stats_pokemon.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/pokemon_data_entity.dart';
import 'divider_stats.dart';

class BaseStatsPokemon extends StatelessWidget {
  final PokemonDataEntity pokemon;
  const BaseStatsPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          value: pokemon.specialAttack.toString(),
                        ),
                        TextValueStatsPokemon(
                          value: pokemon.specialDefense.toString(),
                        ),
                        TextValueStatsPokemon(
                          value: pokemon.speed.toString(),
                        ),
                      ],
                    ),
                    SizedBox(width: size.width * 0.020),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            valueStats: pokemon.specialDefense,
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
    );
  }
}
