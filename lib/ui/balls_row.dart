import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:snooker_score_table/core/model/player.dart';
import 'package:snooker_score_table/screens/score_board/mobx/score_board_store.dart';
import 'package:snooker_score_table/ui/ball.dart';

class BallsRow extends StatelessWidget {
  final Function? onTapRed;
  final Function? onTapYellow;
  final Function? onTapGreen;
  final Function? onTapBrown;
  final Function? onTapBlue;
  final Function? onTapPink;
  final Function? onTapBlack;
  final int? redScore;
  final int? yellowScore;
  final int? greenScore;
  final int? brownScore;
  final int? blueScore;
  final int? pinkScore;
  final int? blackScore;

  const BallsRow({
    super.key,
    this.onTapRed,
    this.onTapYellow,
    this.onTapGreen,
    this.onTapBrown,
    this.onTapBlue,
    this.onTapPink,
    this.onTapBlack,
    this.redScore,
    this.yellowScore,
    this.greenScore,
    this.brownScore,
    this.blueScore,
    this.pinkScore,
    this.blackScore
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SnookerBall(color: Colors.red, onTap: onTapRed ?? () => onTapRed?.call(), score: redScore)),
        Expanded(child: SnookerBall(color: Colors.yellow, onTap: onTapYellow ?? () => onTapYellow?.call(), score: yellowScore)),
        Expanded(child: SnookerBall(color: Colors.green, onTap: onTapGreen ?? () => onTapGreen?.call(), score: greenScore,)),
        Expanded(child: SnookerBall(color: Colors.brown, onTap: onTapBrown ?? () => onTapBrown?.call(), score: brownScore,)),
        Expanded(child: SnookerBall(color: Colors.blue, onTap: onTapBlue ?? () => onTapBlue?.call(), score: blueScore,)),
        Expanded(child: SnookerBall(color: Colors.pink, onTap: onTapPink ?? () => onTapPink?.call(), score: pinkScore,)),
        Expanded(child: SnookerBall(color: Colors.grey.shade700, onTap: onTapBlack ?? () => onTapBlack?.call(), score: blackScore,)),
      ],
    );
  }
}
