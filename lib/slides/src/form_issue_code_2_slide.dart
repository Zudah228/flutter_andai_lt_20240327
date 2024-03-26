import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../components/subtitle.dart';

class FormIssueCode2Slide extends FlutterDeckSlideWidget {
  FormIssueCode2Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_issue_code_2',
            header: FlutterDeckHeaderConfiguration(
              title: 'Formが抱える問題 ③',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return FlutterDeckSubtitledComponent(
          subtitle: 'Form ウィジェットを使えば',
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        width: constraints.maxWidth,
                        child: const FittedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlutterDeckCodeHighlight(
                                code: _codeOnPressed,
                                fileName: 'my_form_widget.dart',
                              ),
                              FlutterDeckCodeHighlight(
                                code: _codeValidation,
                                fileName: 'user_form_validation.dart',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Flexible(
                      child: FlutterDeckBulletList(
                        items: const [
                          'ある程度構造化され・関心事の分離がされている',
                          'エラーメッセージが出るので、必ずしもダイアログで通知する必要がない',
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static const _codeOnPressed = '''
class _MyFormWidgetState extends State<MyFormWidget> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _onPressed() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // ... save implements
  }

    Form(
      key: _formKey,
      child: [
        TextFormField(
          validator: UserFormValidation.name,
        ),
        TextFormField(
          validator: UserFormValidation.age,
        ),
      ]
    )

''';
  static const _codeValidation = '''
class UserFormValidation {
  const UserFormValidation._();

  static String? name(String? value) {
    return value!.isEmpty ? '必須項目です' : null;
  }

  static String? age(String? value) {
    return value!.isEmpty
      ? '必須項目です' 
      : int.tryParse(value) == null
        ? '数字で入力してください'
        : null;
  }
}
''';
}
