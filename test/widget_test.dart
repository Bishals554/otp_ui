import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otp_ui/presentation/widgets/custom_keyboard.dart';

void main() {
  testWidgets('CustomKeyboard test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: CustomKeyboard(),
          ),
        ),
      ),
    );

    // Inputting numbers
    for (var i = 1; i <= 9; i++) {
      await tester.tap(find.text('$i'));
      await tester.pump();
      expect(find.text('$i'), findsOneWidget);
    }

    // Inputting '0'
    await tester.tap(find.text('0'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);

    const maxLength = 6;
    const inputText = '123456';
    for (var i = 0; i < inputText.length; i++) {
      final textFinder = find.byWidgetPredicate(
          (widget) => widget is Text && widget.data == inputText[i]);
      await tester.tap(textFinder);
      await tester.pump();
      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.data!.length <= maxLength, true);
    }

    // Tapping backspace
    for (var i = 0; i < inputText.length; i++) {
      await tester.tap(find.byIcon(Icons.backspace_outlined));
      await tester.pump();
      final newText = inputText.substring(0, inputText.length - i - 1);
      final textFinder = find.byWidgetPredicate(
          (widget) => widget is Text && widget.data == newText);
      final textWidgets = textFinder.evaluate().map((e) => e.widget).toList();
      if (textWidgets.isNotEmpty) {
        final textWidget = textWidgets.first as Text;
        expect(textWidget.data, newText);
      }
    }
  });
}
