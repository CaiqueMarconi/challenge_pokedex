import 'package:flutter/material.dart';

class TextValueStatsPokemon extends StatelessWidget {
  final String value;
  const TextValueStatsPokemon({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      value.toString().padLeft(3, '0'),
      style: TextStyle(
        fontSize: size.width * 0.040,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
