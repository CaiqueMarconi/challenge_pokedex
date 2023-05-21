import 'package:flutter/material.dart';

import '../../../core/themes/colors/string_colors.dart';

class RowSearchAndButtonOrderer extends StatelessWidget {
  const RowSearchAndButtonOrderer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: size.height * 0.050,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                size.width * 0.060,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(
                    0,
                    3,
                  ),
                ),
              ],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: StringColors.red,
                  size: size.width * 0.060,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(width: size.width * 0.050),
        Container(
          alignment: Alignment.center,
          height: size.height * 0.1,
          width: size.width * 0.1,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: StringColors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(
                  0,
                  3,
                ),
              ),
            ],
            color: StringColors.white,
            shape: BoxShape.circle,
          ),
          child: Text(
            '#',
            style: TextStyle(
              color: StringColors.red,
              fontSize: size.width * 0.060,
            ),
          ),
        )
      ],
    );
  }
}
