import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../common/common.dart';
import '../../components/extended_flutter_deck_bullet_list.dart';

class SummarySlide extends FlutterDeckSlideWidget {
  SummarySlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/summary_1_slide',
            title: 'まとめ',
            header: FlutterDeckHeaderConfiguration(
              title: 'まとめ',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return ExtendedFlutterDeckBulletList(
          items: [
            const TextSpan(text: 'フォームの構築のための、From ウィジェットが存在する'),
            const TextSpan(
              text: 'しかし、FormField の種類が極端に少なく、使いづらい'
                  '\n　→パッケージに頼るか、FormField を自作するしかない',
            ),
            TextSpan(
              children: [
                const TextSpan(text: 'FormField を自作するポイント'),
                for (var i = 0; i < handmadeFormFieldPoints.length; i++) ...[
                  const TextSpan(text: '\n　▫️'),
                  handmadeFormFieldPoints[i]
                ]
              ],
            )
          ],
        );
      },
    );
  }
}
