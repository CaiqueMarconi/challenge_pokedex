import 'package:challenge_pokedex/app/core/themes/colors/string_colors.dart';
import 'package:challenge_pokedex/app/core/themes/images/string_images.dart';
import 'package:challenge_pokedex/app/home/presenter/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

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
    widget.homeController.loadDataPokemons();
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
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
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
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontSize: size.width * 0.036,
                            ),
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
                            color: Colors.black.withOpacity(0.3),
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
                ),
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
                    onLoading: (loading) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    onState: ((context, state) {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: size.width / 2,
                            crossAxisSpacing: size.width * 0.010,
                          ),
                          itemCount: widget.homeController.homeStore.state
                              .listPokemonData.length,
                          itemBuilder: (context, index) {
                            final pokemon = widget.homeController.homeStore
                                .state.listPokemonData[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  size.width * 0.026,
                                ),
                              ),
                              elevation: 4,
                              child: Container(
                                height: size.height * 0.22,
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
                                      height: size.height * 0.089,
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
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                '#00${pokemon.id}',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: size.width * 0.036,
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
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                        Expanded(
                                          child: Text(
                                            pokemon.name,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: size.width * 0.036,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
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
