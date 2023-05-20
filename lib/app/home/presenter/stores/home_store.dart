import 'package:challenge_pokedex/app/home/domain/helpers/params/get_pokemon_url_param.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:challenge_pokedex/app/core/shared/failure/app_exception/i_app_exception.dart';
import 'package:challenge_pokedex/app/home/domain/usecases/get_pokemon_data_usecase/i_get_pokemon_data_usecase.dart';
import 'package:challenge_pokedex/app/home/domain/usecases/get_pokemon_usecase/i_get_pokemon_url_usecase.dart';
import 'package:challenge_pokedex/app/home/presenter/stores/state/home_state.dart';

class HomeStore extends StreamStore<IAppException, HomeState> {
  final IGetPokemonDataUsecase _getPokemonDataUsecase;
  final IGetPokemonUrlUsecase _getPokemonUrlUsecase;

  HomeStore({
    required IGetPokemonDataUsecase getPokemonDataUsecase,
    required IGetPokemonUrlUsecase getPokemonUrlUsecase,
  })  : _getPokemonDataUsecase = getPokemonDataUsecase,
        _getPokemonUrlUsecase = getPokemonUrlUsecase,
        super(HomeState.init());

  Future<void> getPokemonUrl(GetPokemonUrlParam param) async {
    setLoading(true);
    final result = await _getPokemonUrlUsecase.call(param);
    result.fold(
      (l) => setError(l),
      (r) => update(
        state.copyWith(listPokemonUrl: r),
      ),
    );
    setLoading(false);
  }

  Future<void> getPokemonData() async {
    setLoading(true);
    final result = await _getPokemonDataUsecase.call(state.listPokemonUrl);
    result.fold((l) => setError(l), (r) {
      state.listPokemonData.addAll(r);
      update(
        state.copyWith(
          listPokemonData: state.listPokemonData,
          updateList: false,
        ),
      );
    });
    setLoading(false);
  }

  void setUpdatePokemon() {
    update(state.copyWith(updateList: !state.updateList));
  }
}
