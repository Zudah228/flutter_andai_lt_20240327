import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

import '../../components/subtitle.dart';

class Introduction5Slide extends FlutterDeckSlideWidget {
  Introduction5Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/introduction_5_slide',
            title: 'Form ウィジェットとは ①',
            header: FlutterDeckHeaderConfiguration(
              title: 'Form ウィジェットとは ①',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(builder: (context) {
      return FlutterDeckSubtitledComponent(
        subtitle: 'Form ウィジェットとは',
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FlutterDeckCodeHighlight(
              code: '''

    final _formKey = GlobalKey<FormState>();
    
    @override
    Widget build(BuildContext context) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(),
            FormField(),
            FormField(),
          ]
        )
      );
    }''',
            ),
            const Gap(24),
            Flexible(
              child: FlutterDeckBulletList(
                items: const [
                  '入力フォームに必要な API を備えた StatefulWidget',
                  '登場人物\n　▫️ Form ウィジェット\n　▫️ FormField ウィジェット（またはその継承）',
                  'Form ウィジェットの子孫に、複数の FormField ウィジェット（またはその継承）を持たせる',
                  'GlobalKey 経由で FormState の関数を実行できる'
                      '\n　▫️ validate 関数'
                      '\n　▫️ reset 関数'
                      '\n　▫️ save 関数'
                      '\n　▫️ validateGranularly 関数（3.20.0以降）',
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
