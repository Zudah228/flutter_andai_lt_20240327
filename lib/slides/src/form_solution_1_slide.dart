import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

import '../../components/extended_flutter_deck_bullet_list.dart';
import '../../components/linked_text.dart';
import '../../components/subtitle.dart';

class FormSolution1Slide extends FlutterDeckSlideWidget {
  FormSolution1Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_solution_1',
            title: '解決策 - 1 パッケージに頼る①',
            header: FlutterDeckHeaderConfiguration(
              title: '解決策 - 1 パッケージに頼る①',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return FlutterDeckSubtitledComponent(
          subtitle: '人気のパッケージ',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ExtendedFlutterDeckBulletList(
                  items: [
                    LinkedTextSpan(
                      text: 'reactive_forms',
                      url: 'https://pub.dev/packages/reactive_forms',
                    ),
                    LinkedTextSpan(
                      text: 'flutter_form_builder',
                      url: 'https://pub.dev/packages/flutter_form_builder',
                    ),
                  ],
                ),
              ),
              const Gap(64),
              const Subtitle('メリット'),
              Expanded(
                flex: 2,
                child: FlutterDeckBulletList(
                  items: const [
                    'かなり機能拡張されている',
                    'FormField も幅広くサポートされている',
                  ],
                ),
              ),
              const Subtitle('デメリット'),
              Expanded(
                flex: 2,
                child: FlutterDeckBulletList(
                  items: const [
                    '依存パッケージが増える',
                    'パッケージを使うにしても、Form のどこを解決しているか、裏側を理解していないと、導入のリスクがある'
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
