import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final timerprovider =
    StateNotifierProvider<TimerProvider, int>((ref) => TimerProvider());

class TimerProvider extends StateNotifier<int> {
  TimerProvider() : super(60) {
    startTimer();
  }

  Timer? _timer;

  void startTimer() {
    state = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
