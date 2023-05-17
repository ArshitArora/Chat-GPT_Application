
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
class Loading extends StatelessWidget {
  final String text;
  const Loading({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff444654),
      padding: const EdgeInsets.all(8),
      child:  AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            textStyle: const TextStyle(
              color: Color(0xffd1d5db),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
        totalRepeatCount: 1,
      ),
    );
  }
}