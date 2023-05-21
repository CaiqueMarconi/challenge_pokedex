import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/themes/colors/string_colors.dart';
import '../../../core/themes/images/string_images.dart';

class BackgroundImageAndCard extends StatelessWidget {
  const BackgroundImageAndCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
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
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.018),
          ),
        ),
        SizedBox(height: size.height * 0.012),
      ],
    );
  }
}
