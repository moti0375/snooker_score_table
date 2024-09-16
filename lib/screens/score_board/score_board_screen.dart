import 'package:flutter/material.dart';
import 'package:snooker_score_table/core/di/di.dart';
import 'package:snooker_score_table/core/model/ball.dart';
import 'package:snooker_score_table/core/model/player.dart';
import 'package:snooker_score_table/screens/score_board/mobx/score_board_store.dart';
import 'package:snooker_score_table/ui/balls_row.dart';
import 'package:snooker_score_table/ui/game_board.dart';
import 'package:snooker_score_table/ui/player_board.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:snooker_score_table/ui/start_match_dialog.dart';

class ScoreBoardScreen extends StatefulWidget {
  const ScoreBoardScreen({super.key});

  @override
  State<ScoreBoardScreen> createState() => _ScoreBoardScreenState();

  static Widget create() {
    return Provider<ScoreBoardStore>(
      create: (context) => getIt.get<ScoreBoardStore>(),
      child: const ScoreBoardScreen(),
    );
  }
}

class _ScoreBoardScreenState extends State<ScoreBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Observer(builder: (context) {
          return SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: StreamBuilder<Player?>(
                              stream: Provider.of<ScoreBoardStore>(context, listen: false).player1Stream,
                              builder: (context, snapshot) {
                                return PlayerBoard(
                                    player: snapshot.data,
                                    select: () => Provider.of<ScoreBoardStore>(context, listen: false).player1Turn());
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GameBoard(
                            onStartGame: () {
                              _showStartFrameDialog();
                            },
                            toggleResume: () => Provider.of<ScoreBoardStore>(context, listen: false).togglePause(),
                            onStopGame: () {},
                          ),
                        ),
                        Expanded(
                            child: StreamBuilder<Player?>(
                                stream: Provider.of<ScoreBoardStore>(context, listen: false).player2Stream,
                                builder: (context, snapshot) {
                                  return PlayerBoard(
                                    player: snapshot.data,
                                    select: () =>
                                        Provider.of<ScoreBoardStore>(context, listen: false).player2Turn(),
                                  );

                                }))
                      ],
                    )),
                    BallsRow(
                      onTapRed: () => Provider.of<ScoreBoardStore>(context, listen: false).onBallPot(Ball.red),
                      onTapYellow: () => Provider.of<ScoreBoardStore>(context, listen: false).onBallPot(Ball.yellow),
                      onTapGreen: () => Provider.of<ScoreBoardStore>(context, listen: false).onBallPot(Ball.green),
                      onTapBrown: () => Provider.of<ScoreBoardStore>(context, listen: false).onBallPot(Ball.brown),
                      onTapBlue: () => Provider.of<ScoreBoardStore>(context, listen: false).onBallPot(Ball.blue),
                      onTapPink: () => Provider.of<ScoreBoardStore>(context, listen: false).onBallPot(Ball.pink),
                      onTapBlack: () => Provider.of<ScoreBoardStore>(context, listen: false).onBallPot(Ball.black),
                    )
                  ],
                ),
              ),
            ),
          );
        }) // This trailing comma makes auto-formatting nicer for build methods.
        );
    ;
  }

  void _showStartFrameDialog() async {
    await showDialog(
      context: context,
      builder: (_) => StartFrameDialog(
        onSubmit: (players) => Provider.of<ScoreBoardStore>(context, listen: false).startGame(players[0], players[1]),
      ),
    );
  }
}
