import 'package:snooker_score_table/core/model/ball.dart';
import 'package:snooker_score_table/core/model/game.dart';
import 'package:injectable/injectable.dart';

abstract interface class GameManager{
  void newGame(Game game);
  void newBreak();
  void fault(int penalty);
  void onBallPotted(Ball ball);
}


@LazySingleton(as: GameManager)
class GameManagerImpl implements GameManager{
  Game? _currentGame;
  @override
  void newGame(Game game) {
    _currentGame = game;
    _currentGame?.startGame();
  }

  @override
  void fault(int penalty) {
    //todo - implement fault logic..
  }

  @override
  void newBreak() {
    _currentGame?.switchPlayer();
  }

  @override
  void onBallPotted(Ball ball) {
  }



}