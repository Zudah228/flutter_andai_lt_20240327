import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../components/extended_flutter_deck_bullet_list.dart';

class FormImportance3Slide extends FlutterDeckSlideWidget {
  FormImportance3Slide()
      : super(
          configuration: FlutterDeckSlideConfiguration(
            route: '/form_importance_3',
            header: const FlutterDeckHeaderConfiguration(
              title: 'Form の重要性 ③',
            ),
            steps: steps,
          ),
        );
  static const _items = [
    'クライアントワークでも、フォームに関する要望が多く上がる',
    'フォームの内部の理解を深め、難しいフォームの実現の準備をしておく',
    '',
  ];

  static int get steps => _items.length + 1;

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return Column(
          children: [
            Flexible(
              flex: 4,
              child: ExtendedFlutterDeckBulletList(
                useSteps: true,
                items: _items,
              ),
            ),
          ],
        );
      },
    );
  }
}
