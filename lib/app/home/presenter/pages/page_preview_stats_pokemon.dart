import 'package:challenge_pokedex/app/core/themes/colors/string_colors.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/enums/enum_type_pokemon.dart';
import 'package:challenge_pokedex/app/home/presenter/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../widgets/background_image_and_card.dart';
import '../widgets/base_stats_pokemon.dart';
import '../widgets/buttons_next_and_previous_page.dart';
import '../widgets/row_data_about_pokemon.dart';
import '../widgets/row_types_pokemon.dart';

class PagePreviewStatsPokemon extends StatefulWidget {
  final HomeController homeController;
  final int indexSelected;
  const PagePreviewStatsPokemon({
    super.key,
    required this.homeController,
    required this.indexSelected,
  });

  @override
  State<PagePreviewStatsPokemon> createState() =>
      _PagePreviewStatsPokemonState();
}

class _PagePreviewStatsPokemonState extends State<PagePreviewStatsPokemon> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.indexSelected);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScopedBuilder(
      store: widget.homeController.homeStore,
      onState: ((context, state) {
        return PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: widget.homeController.listPokemon.length,
          itemBuilder: ((context, index) {
            return Container(
              color: EnumTypePokemonExtension.colorThemePokemonType(
                widget.homeController.listPokemon[index].typePokemon[0]
                    .typePokemon,
              ),
              child: SafeArea(
                child: Scaffold(
                    backgroundColor:
                        EnumTypePokemonExtension.colorThemePokemonType(
                      widget.homeController.listPokemon[index].typePokemon[0]
                          .typePokemon,
                    ),
                    body: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: size.width * 0.040,
                            left: size.width * 0.060,
                          ),
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
                                    widget
                                        .homeController.listPokemon[index].name,
                                    style: TextStyle(
                                      fontSize: size.width * 0.080,
                                      fontWeight: FontWeight.w700,
                                      color: StringColors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '#${widget.homeController.listPokemon[index].id.toString().padLeft(3, '0')}',
                                style: TextStyle(
                                  color: StringColors.white,
                                  fontSize: size.width * 0.050,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const BackgroundImageAndCard(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: size.height * 0.89,
                            child: Column(
                              children: [
                                Image.network(
                                  widget.homeController.listPokemon[index].img,
                                  scale: 1.8,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return SizedBox(
                                      height: size.height * 0.37,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                RowTypesPokemon(
                                  pokemon:
                                      widget.homeController.listPokemon[index],
                                ),
                                SizedBox(height: size.height * 0.018),
                                Expanded(
                                  child: Text(
                                    'About',
                                    style: TextStyle(
                                      color: EnumTypePokemonExtension
                                          .colorThemePokemonType(
                                        widget.homeController.listPokemon[index]
                                            .typePokemon[0].typePokemon,
                                      ),
                                      fontSize: size.width * 0.062,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.018),
                                RowDataAboutPokemon(
                                  pokemon:
                                      widget.homeController.listPokemon[index],
                                ),
                                SizedBox(height: size.height * 0.026),
                                Text(
                                  'Base Stats',
                                  style: TextStyle(
                                    color: EnumTypePokemonExtension
                                        .colorThemePokemonType(
                                      widget.homeController.listPokemon[index]
                                          .typePokemon[0].typePokemon,
                                    ),
                                    fontSize: size.width * 0.062,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.026),
                                BaseStatsPokemon(
                                  pokemon:
                                      widget.homeController.listPokemon[index],
                                ),
                              ],
                            ),
                          ),
                        ),
                        ButtonsNextAndPreviousPokemon(
                          pageController: _pageController,
                          index: index,
                          lenghtListPokemon:
                              widget.homeController.listPokemon.length - 1,
                        )
                      ],
                    )),
              ),
            );
          }),
        );
      }),
    );
  }
}
