import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

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
                    'FormFieldState は、StatefulWidget である の、State 部分',
                  ],
                ),
              ),
              const Gap(32),
              const Subtitle('ポイント'),
              Flexible(
                child: ExtendedFlutterDeckBulletList(
                  items: const [
                    TextSpan(text: 'field.value で現在値の表示'),
                    TextSpan(
                      text: 'field.didChange で、FormFieldState.value へ値を同期',
                    ),
                    TextSpan(text: 'field.errorText でエラーメッセージの表示'),
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '外部からの値参照は、onChanged を生やすのではなく、GlobalKey 経由で取得する\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: '　→ initialValue などと同期が難しくなるから'),
                      ],
                    ),
                  ],
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
