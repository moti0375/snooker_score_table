import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:snooker_score_table/core/model/ball.dart';
import 'package:snooker_score_table/core/model/player.dart';
import 'package:snooker_score_table/ui/balls_row.dart';

class PlayerBoard extends StatelessWidget {
  final Function select;
  final Player? player;

  const PlayerBoard({super.key, required this.player, required this.select});

  @override
  Widget build(BuildContext context) {
    var color = player?.playing == true ? Colors.green : Colors.white;
    var radius = const Radius.circular(10.0);
    return GestureDetector(
      onTap: () => select(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: color, width: 1.5),
                        borderRadius: BorderRadius.only(topLeft: radius, topRight: radius)),
                    child: AutoSizeText(
                      player?.name ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                border: Border.all(color: color, width: 1.5),
                borderRadius: BorderRadius.only(bottomLeft: radius, bottomRight: radius),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: AutoSizeText("${player?.getScore() ?? 0} ",
                              style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  "BREAK",
                                  style: Theme.of(context).textTheme.titleMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                  child: AutoSizeText(
                                "${player?.getBreakScore() ?? 0} ",
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.center,
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BallsRow(
                        redScore: player?.potted[Ball.red],
                        yellowScore: player?.potted[Ball.yellow],
                        greenScore: player?.potted[Ball.green],
                        brownScore: player?.potted[Ball.brown],
                        blueScore: player?.potted[Ball.blue],
                        pinkScore: player?.potted[Ball.pink],
                        blackScore: player?.potted[Ball.black],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
