import 'package:flutter/material.dart';

import '../../../core/themes/colors/string_colors.dart';
import '../../domain/entities/pokemon_data_entity.dart';

class CardPresentationPokemon extends StatelessWidget {
  final PokemonDataEntity pokemon;
  const CardPresentationPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          size.width * 0.026,
        ),
      ),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: StringColors.greyLight,
          ),
          color: StringColors.white,
          borderRadius: BorderRadius.circular(
            size.width * 0.026,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              width: double.maxFinite,
              height: size.height * 0.060,
              decoration: BoxDecoration(
                color: StringColors.greyLight.withOpacity(0.2),
                borderRadius: BorderRadius.circular(
                  size.width * 0.026,
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: size.width * 0.020),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '#${pokemon.id.toString().padLeft(3, '0')}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * 0.030,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    child: Image.network(
                      pokemon.img,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    pokemon.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * 0.032,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
