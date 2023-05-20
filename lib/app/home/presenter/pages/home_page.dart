import 'package:challenge_pokedex/app/core/themes/colors/string_colors.dart';
import 'package:challenge_pokedex/app/core/themes/images/string_images.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/params/get_pokemon_url_param.dart';
import 'package:challenge_pokedex/app/home/presenter/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/helpers/string_endpoint.dart';
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
    widget.homeController.loadDataPokemons(
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
                  margin: EdgeInsets.all(size.width * 0.014),
                  child: ScopedBuilder(
                    store: widget.homeController.homeStore,
                    onState: ((context, state) {
                      if (widget.homeController.listPokemons.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: size.width / 3,
                          ),
                          itemCount: widget.homeController.listPokemons.length,
                          itemBuilder: (context, index) {
                            final pokemon =
                                widget.homeController.listPokemons[index];
                            final listPokemon =
                                widget.homeController.listPokemons;
                            if (listPokemon.length - 1 == index &&
                                widget.homeController.homeStore.state
                                    .updateList) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Carregando mais Pokemons...',
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: size.height * 0.010),
                                  const CircularProgressIndicator(),
                                ],
                              );
                            }

                            if (listPokemon.length - 1 == index &&
                                !widget.homeController.homeStore.state
                                    .updateList) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                widget.homeController.homeStore
                                    .setUpdatePokemons();
                                widget.homeController.loadDataPokemons(
                                  GetPokemonUrlParam(
                                    'https://pokeapi.co/api/v2/pokemon/?offset=${listPokemon.length + 1}&limit=20}',
                                  ),
                                );
                              });

                              return Container();
                            } else {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    size.width * 0.026,
                                  ),
                                ),
                                elevation: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: StringColors.greyLight,
                                    ),
                                    color: StringColors.white,
                                    borderRadius: BorderRadius.circular(
                                      size.width * 0.026,
                                    ),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        width: double.maxFinite,
                                        height: size.height * 0.060,
                                        decoration: BoxDecoration(
                                          color: StringColors.greyLight
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(
                                            size.width * 0.026,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: size.width * 0.020),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  '#${pokemon.id.toString().padLeft(3, '0')}',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize:
                                                        size.width * 0.030,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: SizedBox(
                                              child: Image.network(
                                                pokemon.img,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              pokemon.name,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: size.width * 0.032,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                          });
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
