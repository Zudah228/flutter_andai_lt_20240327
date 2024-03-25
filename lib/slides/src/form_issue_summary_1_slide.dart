import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FormIssueSummary1Slide extends FlutterDeckSlideWidget {
  FormIssueSummary1Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_issue_summary_1',
            title: 'Formが抱える問題 ③',
            header: FlutterDeckHeaderConfiguration(
              title: 'Formが抱える問題 ③',
              showHeader: false,
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'なぜ Form は使われないのか',
    );
  }
}
