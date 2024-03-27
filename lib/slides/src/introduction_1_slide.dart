import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Introduction1Slide extends FlutterDeckSlideWidget {
  Introduction1Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/introduction_1',
            title: 'flutter_deck について',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: '''flutter_deck 使うてます''',
      subtitle: 'https://github.com/mkobuolys/flutter_deck',
    );
  }
}
