import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:snooker_score_table/core/game_manager/game_manager.dart';
import 'package:snooker_score_table/core/model/ball.dart';
import 'package:snooker_score_table/core/model/player.dart';
import 'package:snooker_score_table/core/timer/timer.dart';

part 'score_board_store.g.dart';

@injectable
// ignore: library_private_types_in_public_api
class ScoreBoardStore = _ScoreBoardStore with _$ScoreBoardStore;

abstract class _ScoreBoardStore with Store {

  late Player? _player1;
  late Player? _player2;
  late final TimerController _timer = TimerControllerImpl();

  late Player _currentPlayer;
  _ScoreBoardStore();

  final StreamController<Player?> _player1Controller = StreamController();
  final StreamController<Player?> _player2Controller = StreamController();
  final StreamController<int> _timerController = StreamController();
  Stream<Player?> get player1Stream => _player1Controller.stream;
  Stream<Player?> get player2Stream => _player2Controller.stream;
  Stream<int> get timerStream => _timerController.stream;

  @observable
  late Player? currentPlayer;

  @observable
  int gameTime = 0;

  bool _playing = false;

  @observable
  bool paused = false;

  @action
  startGame(Player player1, Player player2){
    print("Start game, players: player1: $player1, player2: $player2");
    _player1 = player1;
    _player2 = player2;
    _timer.resetTimer();
    _timer.startTimer();
    _timer.onTick = (elapsed) {
      print("elapsed: $elapsed");
      gameTime = elapsed;
    };
    paused = false;
    _playing = true;
    player1Turn();
  }

  @action
  togglePause(){
    if(paused){
      _timer.startTimer();
      paused = false;
    } else {
      _timer.stopTimer();
      paused = true;
    }
  }

  @action
  player1Turn(){
    if(_playing){
      _player1?.startBreak();
      _player2?.endBreak();
      currentPlayer = _player1;
      notifyPlayers();
    }
  }

  @action
  player2Turn(){
    if(_playing){
      _player1?.endBreak();
      _player2?.startBreak();
      currentPlayer = _player2;
      notifyPlayers();
    }
  }

  @action
  onBallPot(Ball pottedBall){
    if(_playing && !paused){
      currentPlayer?.potBall(pottedBall);
      notifyPlayers();
    }
  }

  void notifyPlayers() {
    _player1Controller.add(_player1);
    _player2Controller.add(_player2);
  }
}