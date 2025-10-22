import 'dart:async';
import 'package:flutter/cupertino.dart';

class TimerViewModel extends ChangeNotifier {
  bool isPlaying = false;
  Timer? timer;
  Duration duration = Duration.zero;
  bool _isDispose = false;

  void startTimer(int initialMinutes, ValueNotifier<bool> isPaused) {
    duration = Duration.zero;
    isPlaying = true;
    notifyListeners();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_isDispose) {
        timer.cancel();
        return;
      }

      if (isPaused.value) return;

      if (duration.inMinutes < initialMinutes) {
        duration += Duration(seconds: 1);
        if (hasListeners) {
          notifyListeners();
        }
      } else {
        stopTime();
      }
    });
  }

  void stopTime() {
    isPlaying = false;
    timer?.cancel();
    if (hasListeners) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _isDispose = true;
    timer?.cancel();
    super.dispose();
  }
}
