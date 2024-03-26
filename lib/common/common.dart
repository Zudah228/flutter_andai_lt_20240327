import 'package:flutter/material.dart';

import '../components/linked_text.dart';

List<TextSpan> get handmadeFormFieldPoints => [
      const TextSpan(text: 'field.value で現在値の表示'),
      const TextSpan(
        text: 'field.didChange で、FormFieldState.value へ値を同期',
      ),
      TextSpan(
        children: [
          const TextSpan(
            text: 'field.errorText でエラーメッセージの表示（',
          ),
          LinkedText.textSpan(
            text: 'InputDecorator',
            url:
                'https://api.flutter.dev/flutter/material/InputDecorator-class.html',
          ),
          const TextSpan(
            text: ' ウィジェットを活用するのも手）',
          ),
        ],
      ),
      const TextSpan(
        children: [
          TextSpan(
            text: '外部からの値参照は、onChanged を生やすのではなく、GlobalKey 経由で取得する\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: '　→ initialValue などと同期が難しくなるから'),
        ],
      ),
    ];
