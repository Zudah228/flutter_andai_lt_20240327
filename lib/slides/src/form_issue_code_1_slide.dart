import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../components/subtitle.dart';
import '../../utils/list_ex.dart';

class FormIssueCode1Slide extends FlutterDeckSlideWidget {
  FormIssueCode1Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_issue_code_1',
            header: FlutterDeckHeaderConfiguration(
              title: 'Formが抱える問題 ①',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return FlutterDeckSubtitledComponent(
          subtitle: 'よく見る実装',
          child: Row(
            children: [
              const Expanded(
                flex: 3,
                child: FittedBox(
                  child: FlutterDeckCodeHighlight(
                    code: _code,
                    fileName: 'my_form_widget.dart',
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: FlutterDeckBulletList(
                  items: const [
                    '条件式の管理が難しい',
                    '「どこがエラーなのか」の判断にかなり工夫がいる',
                  ].addedLfAtLast(5),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static const _code = '''
class _MyFormWidgetState extends State<MyFormWidget> {
  bool get _isValid => _nameController.text.isNotEmpty &&
    _dateTime != null &&
    _ageText != null && nt.tryParse(_ageText) != null;

  Future<void> _onPressed() async {
    if (!_isValid) {
      await showMyAlertDialog(
        context: context,
        title: '入力エラーです',
        message: '入力内容を確認してください',
      );
      return;
    }

    // ... save implements
  }

            ''';
}
