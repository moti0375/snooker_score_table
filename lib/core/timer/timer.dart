import 'dart:async';

 abstract interface class TimerController{
   void startTimer();
   void stopTimer();
   void resetTimer();
   void Function(int elapsedSeconds)? onTick;
 }

class TimerControllerImpl implements TimerController {
  Timer? _timer;
  int _elapsedSeconds = 0;
  final int _interval = 1; // Timer interval in seconds

  @override
  void Function(int elapsedSeconds)? onTick;

  @override
  void startTimer() {
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(Duration(seconds: _interval), (timer) {
      _elapsedSeconds += _interval;
      if (onTick != null) {
        onTick!(_elapsedSeconds);
      }
    });
  }

  // Stop the timer
  @override
  void stopTimer() {
    _timer?.cancel();
  }

  // Reset the timer
  @override
  void resetTimer() {
    stopTimer();
    _elapsedSeconds = 0;
    if (onTick != null) {
      onTick!(_elapsedSeconds);
    }
  }

  // Get the current elapsed time
  int get elapsedSeconds => _elapsedSeconds;

  // Dispose the timer when it's no longer needed
  void dispose() {
    _timer?.cancel();
  }


}