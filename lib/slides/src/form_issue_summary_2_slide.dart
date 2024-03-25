import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FormIssueSummary2Slide extends FlutterDeckSlideWidget {
  FormIssueSummary2Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_issue_summary_2',
            title: 'Formが抱える問題 ④',
            header: FlutterDeckHeaderConfiguration(
              title: 'Formが抱える問題 ④',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return FlutterDeckBulletList(
          items: const [
            '公式ドキュメントの情報が少なすぎる',
            'Form をサポートしているウィジェットが、あまりにも少ない',
            'FormField の自作のハードルが高い',
          ],
        );
      },
    );
  }
}
