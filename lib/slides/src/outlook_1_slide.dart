import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../components/extended_flutter_deck_bullet_list.dart';
import '../../components/linked_text.dart';

class Outlook1Slide extends FlutterDeckSlideWidget {
  Outlook1Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/outlook_1_slide',
            title: '展望 ①',
            header: FlutterDeckHeaderConfiguration(
              title: '展望 ①',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return ExtendedFlutterDeckBulletList(
          items: [
            const TextSpan(text: '現状、頑張って自作するか、パッケージに頼るしかない'),
            TextSpan(
              children: [
                const TextSpan(text: 'Issue は割と上がってるが、あまり進んでいない'),
                TextSpan(
                  children: [
                    const TextSpan(text: '\n　▫️'),
                    LinkedText.textSpan(
                      url: 'https://github.com/flutter/flutter/issues/110760',
                      text: 'exposing FormState _fields value',
                    ),
                  ],
                ),
                TextSpan(
                  children: [
                    const TextSpan(text: '\n　▫️'),
                    LinkedText.textSpan(
                      url: 'https://github.com/flutter/flutter/issues/141941',
                      text: 'Create DropdownMenuFormField #141941',
                    ),
                  ],
                )
              ],
            ),
            TextSpan(
              children: [
                const TextSpan(text: 'バリデーションの管理もやや難解なのも課題' '\n　▫️'),
                LinkedTextSpan(
                  url: 'https://pub.dev/packages/form_validator',
                  text: 'form_validator',
                )
              ],
            ),
            const TextSpan(
              text: 'まだ深掘ってない内容'
                  '\n　▫️Form がどうやって子孫の FormField を管理しているか'
                  '\n　▫️AutovalidateMode'
                  '\n　▫️FormField と ValueNotifier を同期させる'
                  '\n　▫️Image、Checkbox、Range などの自作例'
                  '\n→ 記事にしたい',
            ),
          ],
        );
      },
    );
  }
}
