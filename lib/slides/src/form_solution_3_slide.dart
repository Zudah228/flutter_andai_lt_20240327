import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../components/subtitle.dart';

class FormSolution3Slide extends FlutterDeckSlideWidget {
  FormSolution3Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_solution_3',
            title: '解決策 - 2 FormField を自作する②',
            header: FlutterDeckHeaderConfiguration(
              title: '解決策 - 2 FormField を自作する②',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(builder: (context) {
      return FlutterDeckSubtitledComponent(
        subtitle: 'すでに用意されている機能',
        child: FlutterDeckBulletList(
          items: const [
            'validator',
            'validate',
            'initialValue',
            'reset',
            'AutovalidateMode',
            'enable（引数のみで機能はなし）',
            'onSaved（引数のみで機能はなし）',
          ],
        ),
      );
    });
  }
}
