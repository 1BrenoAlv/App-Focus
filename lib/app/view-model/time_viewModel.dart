import 'dart:async';
import 'package:flutter/cupertino.dart';

class TimerViewmodel extends ChangeNotifier {
  bool isPlaying = false;
  Timer? timer;
  Duration duration = Duration.zero;

  void startTime(int initialMinutes, ValueNotifier<bool> isPaused) {
    duration = Duration.zero;
    isPlaying = true;
    notifyListeners();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(isPaused.value) return;

      if (duration.inMinutes < initialMinutes) {
        duration += Duration(seconds: 1);
        notifyListeners();
      } else {
        isPlaying = false;
        timer.cancel();
      }
    });
  }

  void stopTime() {
    isPlaying = false;
    notifyListeners();
    timer?.cancel();
  }
}
