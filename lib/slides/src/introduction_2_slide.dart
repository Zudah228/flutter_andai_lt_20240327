import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Introduction2Slide extends FlutterDeckSlideWidget {
  Introduction2Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/introduction_2',
            header: FlutterDeckHeaderConfiguration(
              title: '自己紹介',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return Column(
          children: [
            Flexible(
              child: FlutterDeckBulletList(
                items: const [
                  '株式会社アンドエーアイ CTO',
                  'Flutter エンジニア',
                  'タスク管理・採用・人事・勉強会の主催・インターン生の教育など\n',
                  'Zenn や Qiita で発信',
                  'X で Flutter のこと呟いてます',
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
