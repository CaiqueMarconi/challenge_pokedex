import 'package:challenge_pokedex/app/core/themes/colors/string_colors.dart';
import 'package:flutter/material.dart';

enum EnumTypePokemon {
  grass,
  poison,
  fire,
  water,
  bug,
  flying,
  eletric,
  ghost,
  normal,
  psychic,
  steel,
  rock,
}

extension EnumTypePokemonExtension on EnumTypePokemon {
  static EnumTypePokemon convertStringToEnum(String colorPokemonType) {
    final typePokemon = colorPokemonType.toLowerCase();
    if (typePokemon == EnumTypePokemon.grass.name) {
      return EnumTypePokemon.grass;
    }
    if (typePokemon == EnumTypePokemon.poison.name) {
      return EnumTypePokemon.poison;
    }
    if (typePokemon == EnumTypePokemon.fire.name) {
      return EnumTypePokemon.fire;
    }
    if (typePokemon == EnumTypePokemon.water.name) {
      return EnumTypePokemon.water;
    }
    if (typePokemon == EnumTypePokemon.bug.name) {
      return EnumTypePokemon.bug;
    }
    if (typePokemon == EnumTypePokemon.flying.name) {
      return EnumTypePokemon.flying;
    }
    if (typePokemon == EnumTypePokemon.eletric.name) {
      return EnumTypePokemon.eletric;
    }
    if (typePokemon == EnumTypePokemon.ghost.name) {
      return EnumTypePokemon.ghost;
    }
    if (typePokemon == EnumTypePokemon.normal.name) {
      return EnumTypePokemon.normal;
    }
    if (typePokemon == EnumTypePokemon.psychic.name) {
      return EnumTypePokemon.psychic;
    }
    if (typePokemon == EnumTypePokemon.steel.name) {
      return EnumTypePokemon.steel;
    }
    if (typePokemon == EnumTypePokemon.fire.name) {
      return EnumTypePokemon.fire;
    } else {
      return EnumTypePokemon.normal;
    }
  }

  static Color colorThemePokemonType(EnumTypePokemon typePokemon) {
    if (typePokemon == EnumTypePokemon.grass) {
      return StringColors.greenGrass;
    }
    if (typePokemon == EnumTypePokemon.poison) {
      return StringColors.purplePoison;
    }
    if (typePokemon == EnumTypePokemon.fire) {
      return StringColors.redFire;
    }
    if (typePokemon == EnumTypePokemon.water) {
      return StringColors.blueWater;
    }
    if (typePokemon == EnumTypePokemon.bug) {
      return StringColors.greenBug;
    }
    if (typePokemon == EnumTypePokemon.flying) {
      return StringColors.purpleFlying;
    }
    if (typePokemon == EnumTypePokemon.eletric) {
      return StringColors.yellowEletric;
    }
    if (typePokemon == EnumTypePokemon.ghost) {
      return StringColors.purpleGhost;
    }
    if (typePokemon == EnumTypePokemon.normal) {
      return StringColors.colorNormal;
    }
    if (typePokemon == EnumTypePokemon.psychic) {
      return StringColors.pinkPsychic;
    }
    if (typePokemon == EnumTypePokemon.steel) {
      return StringColors.greySteel;
    }
    if (typePokemon == EnumTypePokemon.fire) {
      return StringColors.colorRock;
    } else {
      return StringColors.colorNormal;
    }
  }
}
