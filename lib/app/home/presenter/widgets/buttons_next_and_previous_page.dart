import 'package:flutter/material.dart';

import '../../../core/themes/colors/string_colors.dart';

class ButtonsNextAndPreviousPokemon extends StatelessWidget {
  final PageController _pageController;
  final int index;
  final int lenghtListPokemon;
  const ButtonsNextAndPreviousPokemon({
    Key? key,
    required PageController pageController,
    required this.index,
    required this.lenghtListPokemon,
  })  : _pageController = pageController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.060,
      ),
      child: SizedBox(
        height: size.height * 0.28,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              if (index != 0)
                GestureDetector(
                  onTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: StringColors.white,
                  ),
                ),
              const Spacer(),
              if (index != lenghtListPokemon)
                GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: StringColors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
