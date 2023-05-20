import 'package:challenge_pokedex/app/core/themes/colors/string_colors.dart';
import 'package:flutter/material.dart';

class ColumnLoadingMorePokemon extends StatelessWidget {
  final String text;
  const ColumnLoadingMorePokemon({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.010),
        const CircularProgressIndicator(
          color: StringColors.red,
        ),
      ],
    );
  }
}
