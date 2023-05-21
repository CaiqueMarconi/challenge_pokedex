import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../core/themes/colors/string_colors.dart';
import '../../domain/helpers/params/get_pokemon_url_param.dart';
import '../controllers/home_controller.dart';
import 'card_presentation_pokemon.dart';
import 'column_loading_more_pokemon.dart';

class GridviewListPokemon extends StatelessWidget {
  final HomeController homeController;
  const GridviewListPokemon({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
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
        margin: EdgeInsets.all(size.width * 0.014),
        child: ScopedBuilder(
          store: homeController.homeStore,
          onState: ((context, state) {
            if (homeController.listPokemon.isEmpty) {
              return const Center(
                child: ColumnLoadingMorePokemon(
                  text: 'Carregando Pokedéx',
                ),
              );
            }
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: size.width / 3,
                ),
                itemCount: homeController.listPokemon.length,
                itemBuilder: (context, index) {
                  final pokemon = homeController.listPokemon[index];
                  final listPokemon = homeController.listPokemon;

                  // verifica se a variavel de loading esta true e mostra o loading
                  // de adição de mais pokemon.
                  if (listPokemon.length - 1 == index &&
                      homeController.homeStore.state.updateList) {
                    return const ColumnLoadingMorePokemon(
                        text: 'Carregando mais Pokemon...');
                  }
                  // verifica se o scroll esta no ultimo pokemon da lista e carrega mais pokemon
                  if (listPokemon.length - 1 == index &&
                      !homeController.homeStore.state.updateList) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      homeController.homeStore.setUpdatePokemon();
                      homeController.loadDataPokemon(
                        GetPokemonUrlParam(
                          'https://pokeapi.co/api/v2/pokemon/?offset=${listPokemon.length + 1}&limit=20}',
                        ),
                      );
                    });

                    return Container();
                  } else {
                    // card que mostra todos os pokemon carregados da api
                    return GestureDetector(
                      onTap: () async {
                        Modular.to.pushNamed('/preview_pokemon', arguments: {
                          'pokemon': pokemon,
                          'indexSelected': index,
                        });
                      },
                      child: CardPresentationPokemon(pokemon: pokemon),
                    );
                  }
                });
          }),
        ),
      ),
    );
  }
}
