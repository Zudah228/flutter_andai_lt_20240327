import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class Introduction3Slide extends FlutterDeckSlideWidget {
  Introduction3Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/introduction_3_slide',
            title: 'きっかけ',
            header: FlutterDeckHeaderConfiguration(
              title: 'きっかけ',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return Row(
          children: [
            Image.asset('assets/zenn-screenshot.png'),
            const Gap(24),
            Expanded(
              child: Image.asset(
                'assets/error-form-scroll.gif',
                fit: BoxFit.fitHeight,
                height: double.infinity,
              ),
            ),
          ],
        );
      },
    );
  }
}
