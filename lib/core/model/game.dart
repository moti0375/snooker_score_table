import 'package:snooker_score_table/core/model/player.dart';
import 'package:snooker_score_table/core/timer/timer.dart';

class Game {
   late Player playing;
   Player player1;
   Player player2;
   late TimerController timerController = TimerControllerImpl();

   Game({required this.player1, required this.player2});

   void startGame(){
    playing = player1;
    player1.startBreak();
    _startGameTimer();
   }

   void endGame(){
     player1.endBreak();
     player2.endBreak();
     _stopGameTimer();
   }

   void switchPlayer() {
     if(playing == player1){
       player1.endBreak();
       playing = player2;
       player2.startBreak();
     } else {
       player2.endBreak();
       playing = player1;
       player1.startBreak();
     }
   }

  void _startGameTimer() {

  }

  void _stopGameTimer() {

  }
}
