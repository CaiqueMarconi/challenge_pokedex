import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/themes/colors/string_colors.dart';

class ColumnAboutStatsPokemon extends StatelessWidget {
  final String value;
  final String title;
  final String icon;
  const ColumnAboutStatsPokemon({
    Key? key,
    required this.value,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                icon,
                height: size.width * 0.050,
              ),
              SizedBox(width: size.width * 0.030),
              Text(
                value,
                style: TextStyle(
                  fontSize: size.width * 0.040,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.020),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: TextStyle(
                color: StringColors.greySteel,
                fontSize: size.width * 0.040,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
