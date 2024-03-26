import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

import '../../common/common.dart';
import '../../components/extended_flutter_deck_bullet_list.dart';
import '../../components/subtitle.dart';

class FormSolution4Slide extends FlutterDeckSlideWidget {
  FormSolution4Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_solution_4',
            title: '解決策 - 2 FormField を自作する③',
            header: FlutterDeckHeaderConfiguration(
              title: '解決策 - 2 FormField を自作する③',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    const bulletTextStyle = TextStyle(fontSize: 24);

    return FlutterDeckSlide.blank(
      builder: (context) {
        return FlutterDeckBulletListTheme(
          data: FlutterDeckBulletListTheme.of(context)
              .copyWith(textStyle: bulletTextStyle),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Subtitle('方法'),
              const FlutterDeckCodeHighlight(code: _codeFormFieldBuilder),
              SizedBox(
                height: 100,
                child: FlutterDeckBulletList(
                  items: const [
                    'builder 関数でウィジェット構築を行う',
                    'FormFieldState は、StatefulWidget である FormField ウィジェットの、State 部分',
                  ],
                ),
              ),
              const Gap(32),
              const Subtitle('ポイント'),
              Flexible(
                child: ExtendedFlutterDeckBulletList(
                  items: handmadeFormFieldPoints,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static const _codeFormFieldBuilder = '''builder(FormFieldState<T> field) {
    return // ... implement Widget
}''';
}
