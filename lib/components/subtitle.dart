import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class FlutterDeckSubtitledComponent extends StatelessWidget {
  const FlutterDeckSubtitledComponent({
    super.key,
    required this.subtitle,
    required this.child,
  });
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Subtitle(subtitle),
        const Gap(16),
        Expanded(child: child),
      ],
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final style = FlutterDeckTheme.of(context).textTheme.header.copyWith(
          fontSize: 32,
        );
    return Text(text, style: style);
  }
}
