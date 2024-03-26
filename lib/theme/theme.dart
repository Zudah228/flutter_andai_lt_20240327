import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import 'text_theme.dart';

FlutterDeckThemeData get lightTheme => _baseTheme(brightness: Brightness.light);
FlutterDeckThemeData get darkTheme => _baseTheme(brightness: Brightness.dark);

FlutterDeckThemeData _baseTheme({
  required Brightness brightness,
}) {
  final foundation = FlutterDeckThemeData(
    brightness: brightness,
    textTheme: textTheme,
    theme: ThemeData(
      fontFamily: 'Hiragino Kaku Gothic ProN',
      brightness: brightness,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
      ),
    ),
  );

  return foundation.copyWith(
    splitSlideTheme: FlutterDeckSplitSlideThemeData(
      rightBackgroundColor: foundation.materialTheme.colorScheme.surfaceTint,
      rightColor: foundation.materialTheme.colorScheme.onSurface,
    ),
    bulletListTheme: const FlutterDeckBulletListThemeData(
      textStyle: TextStyle(fontSize: 24),
    ),
    codeHighlightTheme: FlutterDeckCodeHighlightThemeData(
      backgroundColor: switch (brightness) {
        Brightness.dark => const Color(0xff1E1E1E),
        Brightness.light => const Color(0xffF0F0F0),
      },
    ),
  );
}
