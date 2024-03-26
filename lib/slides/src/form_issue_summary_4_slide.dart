import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../components/subtitle.dart';

class FormIssueSummary4Slide extends FlutterDeckSlideWidget {
  FormIssueSummary4Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_issue_summary_4',
            title: 'Formが抱える問題 ⑥',
            header: FlutterDeckHeaderConfiguration(
              title: 'Formが抱える問題 ⑥',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return FlutterDeckSubtitledComponent(
          subtitle: 'Form をサポートしているウィジェットが、あまりにも少ない',
          child: Column(
            children: [
              Flexible(
                child: FlutterDeckBulletList(
                  items: const [
                    'FormField のサブクラスが、TextFormField・CupertinoTextFormFieldRow・DropdownButtonFormField の３つしかない',
                    'DropdownButtonFormField は、とても FormField としての要件を満たしているとは思えない'
                        '　\n▫️M3 のDropdownMenu が登場している',
                    '実質 TextFormField しかない'
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
