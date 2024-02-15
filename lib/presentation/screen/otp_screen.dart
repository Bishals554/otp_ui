import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otp_ui/constant/color.dart';
import 'package:otp_ui/data/providers/timer_provider.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerprovider);
    String formattedTimer =
        '${(timer ~/ 60).toString().padLeft(2, '0')}:${(timer % 60).toString().padLeft(2, '0')}';
    const textStyle = TextStyle(color: ColorProfile.whiteColor, fontSize: 20);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.amber,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text('Authenticating..',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber)),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Please key in activation code is sent to',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            const Text('+609841600501',
                style: TextStyle(fontWeight: FontWeight.w300)),
            const SizedBox(
              height: 20,
            ),
            Pinput(
              defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey))),
              length: 6,
              showCursor: false,
            ),
            const SizedBox(height: 15),
            if (timer > 0)
              Text(
                formattedTimer,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            else
              GestureDetector(
                onTap: () => ref.read(timerprovider.notifier).startTimer(),
                child: const Text(
                  'Resend Code?',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
            const Spacer(),
            Container(
              color: Colors.red,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const <Widget>[
                  Text('1', style: textStyle),
                  Text('2', style: textStyle),
                  Text('3', style: textStyle),
                  Text('4', style: textStyle),
                  Text('5', style: textStyle),
                  Text('6', style: textStyle),
                  Text('7', style: textStyle),
                  Text('8', style: textStyle),
                  Text('9', style: textStyle),
                  Icon(
                    Icons.backspace_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text('0', style: textStyle),
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 25,
                  )
                ].map((key) {
                  return Center(child: key);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
