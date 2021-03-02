import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'gamebloc_event.dart';
part 'gamebloc_state.dart';

class GameblocBloc extends Bloc<GameblocEvent, GameblocState> {
  GameblocBloc() : super(GameblocInitial());
  List<String> list1 = [
    "Trixie",
    "Katya",
    "Adore",
    "Bianca",
    "Gigi",
    "Jackie",
    "Detox",
    "Crystal",
    "Rosé"
  ];
  List<String> list2 = [
    "Trixie",
    "Katya",
    "Adore",
    "Bianca",
    "Gigi",
    "Jackie",
    "Detox",
    "Crystal",
    "Rosé"
  ];
  int index = 0;
  int points = 0;
  @override
  Stream<GameblocState> mapEventToState(
    GameblocEvent event,
  ) async* {
    if (event is PlayEvent) {
      index = 0;
      points = 0;
      list2.shuffle();
      yield PlayingState(
          palabra: list1[index], titulo: 'The word is', contador: points);
    } else if (event is SkipEvent) {
      if (list1[index] != list2[index]) points++;
      index++;
      if (index >= list1.length) {
        yield EndState(titulo: 'You scored', contador: points);
      } else {
        yield PlayingState(
            palabra: list1[index], titulo: 'The word is', contador: points);
      }
    } else if (event is GotEvent) {
      if (list1[index] == list2[index]) points++;
      index++;
      if (index >= list1.length) {
        yield EndState(titulo: 'You scored', contador: points);
      } else {
        yield PlayingState(
            palabra: list1[index], titulo: 'The word is', contador: points);
      }
    } else if (event is EndEvent) {
      yield EndState(titulo: 'You scored', contador: points);
    }
  }
}
