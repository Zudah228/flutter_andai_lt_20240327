import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FormIssueSummary5Slide extends FlutterDeckSlideWidget {
  FormIssueSummary5Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_issue_summary_5',
            title: 'Formが抱える問題 ⑦',
            header: FlutterDeckHeaderConfiguration(
              title: 'Formが抱える問題 ⑦',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return const Text('');
      },
    );
  }
}
