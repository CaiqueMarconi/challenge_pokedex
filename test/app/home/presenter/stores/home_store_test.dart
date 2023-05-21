// ignore_for_file: invalid_use_of_protected_member

import 'package:challenge_pokedex/app/core/shared/failure/app_exception/app_exception.dart';
import 'package:challenge_pokedex/app/home/domain/helpers/params/get_pokemon_url_param.dart';
import 'package:challenge_pokedex/app/home/domain/usecases/get_pokemon_data_usecase/i_get_pokemon_data_usecase.dart';
import 'package:challenge_pokedex/app/home/domain/usecases/get_pokemon_usecase/i_get_pokemon_url_usecase.dart';
import 'package:challenge_pokedex/app/home/presenter/stores/home_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

class GetPokemonUrlUsecaseMock extends Mock implements IGetPokemonUrlUsecase {}

class GetPokemonDataUsecaseMock extends Mock implements IGetPokemonDataUsecase {
}

void main() {
  late IGetPokemonUrlUsecase getPokemonUrlUsecase;
  late IGetPokemonDataUsecase getPokemonDataUsecase;
  late HomeStore store;

  setUpAll(() {
    getPokemonUrlUsecase = GetPokemonUrlUsecaseMock();
    getPokemonDataUsecase = GetPokemonDataUsecaseMock();
    store = HomeStore(
      getPokemonDataUsecase: getPokemonDataUsecase,
      getPokemonUrlUsecase: getPokemonUrlUsecase,
    );
  });
  final mockGetPokemonUrlParam = GetPokemonUrlParam('');
  storeTest<HomeStore>(
    'get pokemon url success',
    build: () {
      when(() => getPokemonUrlUsecase(mockGetPokemonUrlParam))
          .thenAnswer((_) async => const Right([]));
      return store;
    },
    act: (store) => store.getPokemonUrl(mockGetPokemonUrlParam),
    expect: () => [
      tripleState,
    ],
  );

  storeTest<HomeStore>(
    'get pokemon url failure',
    build: () {
      when(() => getPokemonUrlUsecase(mockGetPokemonUrlParam)).thenAnswer(
        (_) async => Left(
          AppException(
            message: '',
            stackTrace: StackTrace.empty,
          ),
        ),
      );
      return store;
    },
    act: (store) => store.getPokemonUrl(mockGetPokemonUrlParam),
    expect: () => [
      tripleError,
    ],
  );
  storeTest<HomeStore>(
    'get pokemon data success',
    build: () {
      final newState = store.state.copyWith(listPokemonUrl: []);
      store.update(newState);
      when(() => getPokemonDataUsecase(store.state.listPokemonUrl))
          .thenAnswer((_) async => const Right([]));
      return store;
    },
    act: (store) => store.getPokemonData(),
    expect: () => [
      tripleState,
    ],
  );

  storeTest<HomeStore>(
    'get pokemon data failure',
    build: () {
      final newState = store.state.copyWith(listPokemonUrl: []);
      store.update(newState);
      when(() => getPokemonDataUsecase(store.state.listPokemonUrl)).thenAnswer(
        (_) async => Left(
          AppException(
            message: '',
            stackTrace: StackTrace.empty,
          ),
        ),
      );
      return store;
    },
    act: (store) => store.getPokemonData(),
    expect: () => [
      tripleError,
    ],
  );

  storeTest<HomeStore>(
    'set Update Pokemon',
    build: () {
      final newState = store.state.copyWith(updateList: false);
      store.update(newState);
      return store;
    },
    act: (store) => store.setUpdatePokemon(),
    expect: () => [
      tripleState,
    ],
  );
}
