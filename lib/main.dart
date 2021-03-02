import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/gamebloc_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Material App Bar'),
        ),
        body: BlocProvider(
          create: (context) => GameblocBloc(),
          child: BlocConsumer<GameblocBloc, GameblocState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is PlayingState) {
                return Container(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Spacer(),
                        Text(state.titulo, style: TextStyle(fontSize: 20)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(state.palabra,
                              style: TextStyle(fontSize: 40)),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                BlocProvider.of<GameblocBloc>(context)
                                    .add(SkipEvent());
                              },
                              child: Text("SKIP"),
                            ),
                            MaterialButton(
                              color: Colors.green,
                              onPressed: () {
                                BlocProvider.of<GameblocBloc>(context)
                                    .add(GotEvent());
                              },
                              child: Text("Got It",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            MaterialButton(
                              onPressed: () {
                                BlocProvider.of<GameblocBloc>(context)
                                    .add(EndEvent());
                              },
                              child: Text("END GAME"),
                            ),
                          ],
                        ),
                        SizedBox(height: 12)
                      ],
                    ),
                  ),
                );
              } else if (state is EndState) {
                return Container(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.titulo, style: TextStyle(fontSize: 20)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(state.contador.toString(),
                              style: TextStyle(fontSize: 40)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              color: Colors.green,
                              onPressed: () {
                                BlocProvider.of<GameblocBloc>(context)
                                    .add(PlayEvent());
                              },
                              child: Text("PLAY AGAIN",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                        SizedBox(height: 12)
                      ],
                    ),
                  ),
                );
              } else
                return Container(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Spacer(),
                        Text('Get ready to', style: TextStyle(fontSize: 20)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Guess the word!',
                              style: TextStyle(fontSize: 40)),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              color: Colors.green,
                              onPressed: () {
                                BlocProvider.of<GameblocBloc>(context)
                                    .add(PlayEvent());
                              },
                              child: Text("PLAY",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                        SizedBox(height: 12)
                      ],
                    ),
                  ),
                );
            },
          ),
        ),
      ),
    );
  }
}
