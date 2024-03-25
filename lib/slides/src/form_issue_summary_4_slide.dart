import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

import '../../components/callout.dart';
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
              const _CallOut(),
              const Gap(32),
              Flexible(
                child: FlutterDeckBulletList(
                  items: const [
                    'FormField のサブクラスが、TextFormField・CupertinoTextFormFieldRow・DropdownButtonFormField の３つしかない',
                    'DropdownButtonFormField は、とても FormField としての要件を満たしているとは思えない',
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

class _CallOut extends StatelessWidget {
  const _CallOut();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CallOut(
          title: '前提',
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '・Form ウィジェットの子ウィジェットに、複数の FormField ウィジェット（またはその継承）\nを持つことで、それらのバリデーションを一気に行ったりする',
              ),
              Gap(8),
              FlutterDeckCodeHighlight(code: '''return Form(
  child: Column(
    children: [
      TextFormField(),
      FormField(),
      FormField(),
    ]
  )
)''')
            ],
          ),
        ),
      ],
    );
  }
}
