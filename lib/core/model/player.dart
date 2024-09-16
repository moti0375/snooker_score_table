import 'package:flutter/cupertino.dart';
import 'package:snooker_score_table/core/model/ball.dart';

class Player extends ChangeNotifier {
  String name;
  int _score = 0;
  bool playing;
  double breakElapseTime = 0.0;
  int _break = 0;

  Map<Ball, int> potted = {
    Ball.red: 0,
    Ball.yellow: 0,
    Ball.green: 0,
    Ball.brown: 0,
    Ball.blue: 0,
    Ball.pink: 0,
    Ball.black: 0,
  };

  Player({required this.name, this.playing = false});

  void potBall(Ball pottedBall) {
    _score += pottedBall.value;
    _break += pottedBall.value;
    potted.update(pottedBall, (value) => value+1);
    notifyListeners();
  }

  int getScore() {
    return _score;
  }

  int getBreakScore() {
    return _break;
  }

  void startBreak() {
    playing = true;
    _break = 0;
  }

  void endBreak() {
    playing = false;
  }
}
