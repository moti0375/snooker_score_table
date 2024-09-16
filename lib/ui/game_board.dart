import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:snooker_score_table/screens/score_board/mobx/score_board_store.dart';
import 'package:snooker_score_table/utils/utils.dart';

class GameBoard extends StatelessWidget {
  final Function onStartGame;
  final Function toggleResume;
  final Function onStopGame;

  const GameBoard({super.key, required this.onStartGame, required this.toggleResume, required this.onStopGame});

  final radius = const Radius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.only(topLeft: radius, topRight: radius)),
                      child: Observer(builder: (context) {
                        return AutoSizeText(
                          formatSeconds(Provider.of<ScoreBoardStore>(context, listen: false).gameTime),
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.only(bottomLeft: radius, bottomRight: radius)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(onPressed: () => onStartGame(), child: const Text("New Frame")),
                    Observer(builder: (context) {
                      return FilledButton(
                          onPressed: () => toggleResume(),
                          child: Provider.of<ScoreBoardStore>(context, listen: false).paused
                              ? const AutoSizeText(
                                  "Resume Frame",
                                  maxLines: 1,
                                )
                              : const AutoSizeText(
                                  "Pause Frame",
                                  maxLines: 1,
                                ));
                    }),],
                ),
              ),
            )
          ],
        ));
  }
}
