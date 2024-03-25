import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import 'components/andai_logo.dart';
import 'slides/slides.dart';
import 'theme/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      speakerInfo: const FlutterDeckSpeakerInfo(
        name: '津田大和',
        description: '株式会社アンドエーアイ',
        socialHandle: '@zudah228',
        imagePath: 'assets/image.webp',
      ),
      configuration: const FlutterDeckConfiguration(
        footer: FlutterDeckFooterConfiguration(
          widget: AndaiLogo(
            width: 100,
          ),
        ),
        controls: FlutterDeckControlsConfiguration(),
      ),
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      slides: slides,
    );
  }
}
