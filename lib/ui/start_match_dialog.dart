
import 'package:flutter/material.dart';
import 'package:snooker_score_table/core/model/player.dart';

class StartFrameDialog extends StatefulWidget {
  final ValueChanged<List<Player>> onSubmit;

  const StartFrameDialog({super.key, required this.onSubmit});

  @override
  State<StartFrameDialog> createState() => _StartFrameDialogState();
}

class _StartFrameDialogState extends State<StartFrameDialog> {
  final TextEditingController _player1Controller = TextEditingController();
  final TextEditingController _player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: AlertDialog(
          content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Enter Players Names"),
            const SizedBox(height: 4,),
            TextFormField(
              controller: _player1Controller,
              onChanged: (text) => _player1Controller.text = text,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 4,),
            TextFormField(
              controller: _player2Controller,
              onChanged: (text) => _player2Controller.text = text,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: _onCancel, child: const Text("Cancel")),
        TextButton(onPressed: _onSubmit, child: const Text("Start"))
      ],),
    );
  }

  void _onSubmit() {
    Player player1 = Player(name: _player1Controller.text);
    Player player2 = Player(name: _player2Controller.text);
    widget.onSubmit([player1, player2]);
    Navigator.of(context).pop();
  }

  void _onCancel() {
    Navigator.of(context).pop();
  }
}
