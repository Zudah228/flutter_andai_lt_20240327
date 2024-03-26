import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkedText extends StatelessWidget {
  const LinkedText({
    super.key,
    required this.url,
    this.label,
    this.style,
  });

  final String url;
  final String? label;
  final TextStyle? style;

  static const textSpan = LinkedTextSpan.new;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textSpan(url: url, text: label, style: style),
    );
  }
}

class LinkedTextSpan extends TextSpan {
  LinkedTextSpan({
    required this.url,
    super.children,
    String? text,
    TextStyle? style,
  }) : super(
          text: text ?? (children == null ? url : null),
          recognizer: TapGestureRecognizer()
            ..onTap = () => launchUrlString(url),
          style: style ?? _defaultTextStyle,
        );

  final String url;

  static const TextStyle _defaultTextStyle = TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
    decorationColor: Colors.blue,
  );
}
