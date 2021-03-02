part of 'gamebloc_bloc.dart';

abstract class GameblocState extends Equatable {
  const GameblocState();

  @override
  List<Object> get props => [];
}

class GameblocInitial extends GameblocState {}

class PlayingState extends GameblocState {
  final String palabra;
  final String titulo;
  final int contador;

  PlayingState(
      {@required this.palabra, @required this.titulo, @required this.contador});

  @override
  List<Object> get props => [palabra, titulo, contador];
}

class EndState extends GameblocState {
  final String titulo;
  final int contador;

  EndState({@required this.titulo, @required this.contador});

  @override
  List<Object> get props => [titulo, contador];
}
