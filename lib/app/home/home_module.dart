import 'package:challenge_pokedex/app/home/domain/usecases/get_pokemon_usecase/get_pokemon_url_usecase.dart';
import 'package:challenge_pokedex/app/home/external/datasources/get_pokemon_url_datasource.dart';
import 'package:challenge_pokedex/app/home/infra/repositories/get_pokemon_url_repository.dart';
import 'package:challenge_pokedex/app/home/presenter/controllers/home_controller.dart';
import 'package:challenge_pokedex/app/home/presenter/pages/home_page.dart';
import 'package:challenge_pokedex/app/home/presenter/pages/page_preview_stats_pokemon.dart';
import 'package:challenge_pokedex/app/home/presenter/stores/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_pokemon_data_usecase/get_pokemon_data_usecase.dart';
import 'external/datasources/get_pokemon_data_datasource.dart';
import 'infra/repositories/get_pokemon_data_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        // controllers
        Bind.singleton(
          (i) => HomeController(i()),
        ),
        // stores
        Bind.lazySingleton(
          (i) => HomeStore(
            getPokemonDataUsecase: i(),
            getPokemonUrlUsecase: i(),
          ),
        ),

        // Get Pokemon Url
        Bind.lazySingleton((i) => GetPokemonUrlUsecase(i())),
        Bind.lazySingleton((i) => GetPokemonUrlRepository(i())),
        Bind.lazySingleton((i) => GetPokemonUrlDatasource(i())),

        // Get Pokemon Data
        Bind.lazySingleton((i) => GetPokemonDataUsecase(i())),
        Bind.lazySingleton((i) => GetPokemonDataRepository(i())),
        Bind.lazySingleton((i) => GetPokemonDataDatasource(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => HomePage(
            homeController: Modular.get<HomeController>(),
          ),
        ),
        ChildRoute(
          '/preview_pokemon',
          child: (_, args) => PagePreviewStatsPokemon(
            homeController: Modular.get<HomeController>(),
            indexSelected: args.data['indexSelected'],
          ),
        ),
      ];
}
