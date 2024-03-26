import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

import '../../components/extended_flutter_deck_bullet_list.dart';
import '../../components/form_management_buttons.dart';
import '../../components/subtitle.dart';

class Introduction6Slide extends FlutterDeckSlideWidget {
  Introduction6Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/introduction_6_slide',
            title: 'Form ウィジェットとは ②',
            header: FlutterDeckHeaderConfiguration(
              title: 'Form ウィジェットとは ②',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return FlutterDeckSubtitledComponent(
          subtitle: 'FormField の持つ機能',
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: ExtendedFlutterDeckBulletList(
                  items: const [
                    '初期値',
                    '値の編集',
                    'バリデーション',
                    'プレースホルダー',
                    'エラー通知'
                        '\netc...',
                  ].map((e) => TextSpan(text: e)).toList(),
                ),
              ),
              const Flexible(flex: 3, child: _FormSample()),
            ],
          ),
        );
      },
    );
  }
}

class _FormSample extends StatelessWidget {
  const _FormSample();

  static String? _validator(String? value) => value!.isEmpty
      ? '必須項目です'
      : int.tryParse(value) == null
          ? '数字で入力してください'
          : null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Form(
        child: Column(
          children: [
            const FormManagementButtons(),
            const Gap(32),
            TextFormField(
              validator: _validator,
            ),
            const Gap(16),
            TextFormField(
              initialValue: '初期値',
              validator: _validator,
            ),
            const Gap(16),
            TextFormField(
              initialValue: 'Autovalidate always',
              autovalidateMode: AutovalidateMode.always,
              validator: _validator,
            ),
          ],
        ),
      ),
    );
  }
}
