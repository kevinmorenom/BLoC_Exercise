part of 'gamebloc_bloc.dart';

abstract class GameblocEvent extends Equatable {
  const GameblocEvent();

  @override
  List<Object> get props => [];
}

class PlayEvent extends GameblocEvent {
  @override
  List<Object> get props => [];
}

class SkipEvent extends GameblocEvent {
  final bool result = false;
  @override
  List<Object> get props => [result];
}

class GotEvent extends GameblocEvent {
  final bool result = true;
  @override
  List<Object> get props => [result];
}

class EndEvent extends GameblocEvent {
  @override
  List<Object> get props => [];
}
