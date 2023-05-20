import 'package:challenge_pokedex/app/core/themes/colors/string_colors.dart';
import 'package:challenge_pokedex/app/core/themes/images/string_images.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/params/get_pokemon_url_param.dart';
import 'package:challenge_pokedex/app/home/presenter/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../../domain/helpers/string_endpoint.dart';
import '../widgets/gridview_list_pokemon.dart';
import '../widgets/row_search_and_button_orderer.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;
  const HomePage({
    super.key,
    required this.homeController,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeController.loadDataPokemon(
      GetPokemonUrlParam(
        StringEndpoint.endpointPokemon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: StringColors.red,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: StringColors.red,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.040,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      StringImages.pokeball,
                      scale: 2,
                    ),
                    SizedBox(width: size.width * 0.030),
                    Text(
                      'Pokedéx',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: StringColors.white,
                        fontSize: size.width * 0.084,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.050),
                child: const RowSearchAndButtonOrderer(),
              ),
              SizedBox(height: size.height * 0.010),
              GridviewListPokemon(
                homeController: widget.homeController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
