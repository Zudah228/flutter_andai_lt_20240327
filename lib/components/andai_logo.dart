import 'package:flutter/material.dart';

class AndaiLogo extends StatelessWidget {
  const AndaiLogo({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final path = switch (brightness) {
      Brightness.dark => 'assets/andai_logo_blackback.png',
      Brightness.light => 'assets/andai_logo.png',
    };
    return Image.asset(
      path,
      height: height,
      width: width,
    );
  }
}
