import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Introduction4Slide extends FlutterDeckSlideWidget {
  Introduction4Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/introduction_4_slide',
            title: 'きっかけ',
            header: FlutterDeckHeaderConfiguration(
              title: 'きっかけ',
              showHeader: false,
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'え、みんな Form ウィジェット使ってんの？',
    );
  }
}
