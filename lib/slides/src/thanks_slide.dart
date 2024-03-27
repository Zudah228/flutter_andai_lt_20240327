import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ThanksSlide extends FlutterDeckSlideWidget {
  ThanksSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/thanks_slide',
            title: '最後に',
            header:
                FlutterDeckHeaderConfiguration(title: '最後に', showHeader: false),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'ご清聴ありがとうございました',
      subtitle: '資料 → https://github.com/Zudah228/flutter_andai_lt_20240327',
    );
  }
}
