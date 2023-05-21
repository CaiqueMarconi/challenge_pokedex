import 'package:flutter/material.dart';

import '../../../core/themes/colors/string_colors.dart';

class DividerStats extends StatelessWidget {
  const DividerStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: 2,
      color: StringColors.greyLight,
    );
  }
}
