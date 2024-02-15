// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:otp_ui/data/providers/timer_provider.dart';

void main() {
  test('Timer Provider Initial State', () {
    final timerProvider = TimerProvider();
    expect(timerProvider.state, 60);
  });

  test('Timer Provider Countdown', () {
    final timerProvider = TimerProvider();
    timerProvider.startTimer();
    expect(timerProvider.state, lessThan(60));
  });
}
