import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Introduction1Slide extends FlutterDeckSlideWidget {
  Introduction1Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/introduction_1',
            title: 'タイトル',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.title(
      title: '''Flutter の Form 
ウィジェットが抱える課題
''',
    );
  }
}
