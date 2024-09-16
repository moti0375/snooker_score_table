// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_board_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScoreBoardStore on _ScoreBoardStore, Store {
  late final _$currentPlayerAtom =
      Atom(name: '_ScoreBoardStore.currentPlayer', context: context);

  @override
  Player? get currentPlayer {
    _$currentPlayerAtom.reportRead();
    return super.currentPlayer;
  }

  bool _currentPlayerIsInitialized = false;

  @override
  set currentPlayer(Player? value) {
    _$currentPlayerAtom.reportWrite(
        value, _currentPlayerIsInitialized ? super.currentPlayer : null, () {
      super.currentPlayer = value;
      _currentPlayerIsInitialized = true;
    });
  }

  late final _$gameTimeAtom =
      Atom(name: '_ScoreBoardStore.gameTime', context: context);

  @override
  int get gameTime {
    _$gameTimeAtom.reportRead();
    return super.gameTime;
  }

  @override
  set gameTime(int value) {
    _$gameTimeAtom.reportWrite(value, super.gameTime, () {
      super.gameTime = value;
    });
  }

  late final _$pausedAtom =
      Atom(name: '_ScoreBoardStore.paused', context: context);

  @override
  bool get paused {
    _$pausedAtom.reportRead();
    return super.paused;
  }

  @override
  set paused(bool value) {
    _$pausedAtom.reportWrite(value, super.paused, () {
      super.paused = value;
    });
  }

  late final _$_ScoreBoardStoreActionController =
      ActionController(name: '_ScoreBoardStore', context: context);

  @override
  dynamic startGame(Player player1, Player player2) {
    final _$actionInfo = _$_ScoreBoardStoreActionController.startAction(
        name: '_ScoreBoardStore.startGame');
    try {
      return super.startGame(player1, player2);
    } finally {
      _$_ScoreBoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic togglePause() {
    final _$actionInfo = _$_ScoreBoardStoreActionController.startAction(
        name: '_ScoreBoardStore.togglePause');
    try {
      return super.togglePause();
    } finally {
      _$_ScoreBoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic player1Turn() {
    final _$actionInfo = _$_ScoreBoardStoreActionController.startAction(
        name: '_ScoreBoardStore.player1Turn');
    try {
      return super.player1Turn();
    } finally {
      _$_ScoreBoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic player2Turn() {
    final _$actionInfo = _$_ScoreBoardStoreActionController.startAction(
        name: '_ScoreBoardStore.player2Turn');
    try {
      return super.player2Turn();
    } finally {
      _$_ScoreBoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onBallPot(Ball pottedBall) {
    final _$actionInfo = _$_ScoreBoardStoreActionController.startAction(
        name: '_ScoreBoardStore.onBallPot');
    try {
      return super.onBallPot(pottedBall);
    } finally {
      _$_ScoreBoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPlayer: ${currentPlayer},
gameTime: ${gameTime},
paused: ${paused}
    ''';
  }
}
