import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../components/extended_flutter_deck_bullet_list.dart';
import '../../components/linked_text.dart';
import '../../components/subtitle.dart';

class Introduction2Slide extends FlutterDeckSlideWidget {
  Introduction2Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/introduction_2',
            header: FlutterDeckHeaderConfiguration(
              title: '自己紹介',
            ),
            steps: 2,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return FlutterDeckSubtitledComponent(
          subtitle: 'づだ',
          child: FlutterDeckSlideStepsBuilder(
            builder: (context, stepNumber) {
              return Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: ExtendedFlutterDeckBulletList(
                      items: [
                        const TextSpan(
                            text: '株式会社アンドエーアイ CTO　'
                                'Flutter エンジニア'),
                        const TextSpan(text: 'タスク管理・採用・人事・勉強会の主催・インターン生の教育など'),
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: '𝕏 で Flutter のこと呟いてます（',
                            ),
                            LinkedText.textSpan(
                              text: '@Zudah228',
                              url: 'https://twitter.com/Zudah228',
                            ),
                            const TextSpan(text: '）')
                          ],
                        ),
                        const TextSpan(
                          text: '趣味'
                              '\n　・Flutter のウィジェット・パッケージ漁り、スマブラ、仮面ライダー、ガンダム\n',
                        ),
                        const TextSpan(
                          text: '最近の流行り'
                              '\n　・Drift パッケージで自作アプリ'
                              '\n　・アニメ『葬送のフリーレン』、『仮面ライダーガッチャード』、『メタルギアソリッド』',
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: double.infinity,
                      child: Visibility(
                        visible: stepNumber >= 2,
                        child: Image.asset(
                          'assets/introduction.JPG',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
