import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

import '../../components/subtitle.dart';

class FormIssueSummary3Slide extends FlutterDeckSlideWidget {
  FormIssueSummary3Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_issue_summary_3',
            title: 'Formが抱える問題 ⑤',
            header: FlutterDeckHeaderConfiguration(
              title: 'Formが抱える問題 ⑤',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return FlutterDeckSubtitledComponent(
          subtitle: '公式ドキュメントの情報が少なすぎる',
          child: Column(
            children: [
              const Flexible(child: _ImageHorizontalView()),
              const Gap(48),
              Flexible(
                child: FlutterDeckBulletList(
                  items: const [
                    'TextFormFieldについて挙げた例しかない',
                    'バリデーションのサンプルコードがかなり簡素',
                    '重要な FormField ウィジェットも１ページに満たない分量',
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

class _ImageHorizontalView extends StatelessWidget {
  const _ImageHorizontalView();

  static const paths = [
    (
      path: 'assets/form-validation.png',
      url: 'https://docs.flutter.dev/cookbook/forms/validation'
    ),
    (
      path: 'assets/form-cookbook.png',
      url: 'https://docs.flutter.dev/cookbook/forms'
    ),
    (
      path: 'assets/form-form-field.png',
      url: 'https://api.flutter.dev/flutter/widgets/FormField-class.html'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          for (final (index, path) in paths.indexed)
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: index != 0 ? 24 : 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: Image.asset(path.path)),
                    Text(path.url),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
