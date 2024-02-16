import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otp_ui/data/providers/keyboard_provider.dart';

final keyboardStateProvider = StateProvider<List<String>>((ref) => []);

class CustomKeyboard extends ConsumerWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 22,
    );
    final TextEditingController controller =
        ref.watch(textEditingControllerProvider);

    return Container(
      color: Colors.red,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          'backspace',
          '0',
          'check'
        ].map((key) {
          if (key == 'backspace') {
            return Center(
              child: IconButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    controller.text = controller.text
                        .substring(0, controller.text.length - 1);
                  }
                },
                icon: const Icon(
                  Icons.backspace_outlined,
                  size: 25,
                ),
                color: Colors.white,
              ),
            );
          } else if (key == 'check') {
            return Center(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 25,
                  )),
            );
          } else {
            return Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  if (controller.text.length < 6) {
                    controller.text += key;
                  }
                },
                child: Text(
                  key,
                  style: textStyle,
                ),
              ),
            );
          }
        }).toList(),
      ),
    );
  }
}
