import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../components/extended_flutter_deck_bullet_list.dart';

class FormImportance2Slide extends FlutterDeckSlideWidget {
  FormImportance2Slide()
      : super(
          configuration: FlutterDeckSlideConfiguration(
            route: '/form_importance_2',
            header: const FlutterDeckHeaderConfiguration(
              title: 'Form の重要性 ②',
            ),
            steps: steps,
          ),
        );
  static const _items = [
    'ユーザー体験に直結',
    'しかし、利便性を求めて複雑になりすぎると、バグを生みやすくなってしまう難しいユーザーインターフェース',
    'エンジニアが、複雑な要件を避けたがる',
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
                bulletPointText: '→',
              ),
            ),
            Flexible(
              flex: 2,
              child: FlutterDeckSlideStepsBuilder(
                builder: (context, stepNumber) {
                  final themeData = FlutterDeckTheme.of(context);
                  if (stepNumber == steps) {
                    return Text(
                      'だからこそ、フォーム設計を深めることは\n価値があり、重要である',
                      style: themeData.textTheme.title.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor:
                            themeData.materialTheme.colorScheme.primary,
                        color: themeData.materialTheme.colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}