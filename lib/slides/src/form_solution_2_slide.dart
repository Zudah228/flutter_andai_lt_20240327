import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../components/subtitle.dart';

class FormSolution2Slide extends FlutterDeckSlideWidget {
  FormSolution2Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_solution_2',
            title: '解決策 - 2 FormField を自作する①',
            header: FlutterDeckHeaderConfiguration(
              title: '解決策 - 2 FormField を自作する①',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return const Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Subtitle('用意されたコンストラクタ'),
                  Expanded(
                    child: SingleChildScrollView(
                      child: FlutterDeckCodeHighlight(
                        code: _codeFormFieldByUnnamedConstructor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Subtitle('継承 * ちゃんと作るならこっちおすすめ'),
                  Expanded(
                    child: SingleChildScrollView(
                      child: FlutterDeckCodeHighlight(
                        code: _codeFormFieldByExtend,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  static const _codeFormFieldByUnnamedConstructor =
      '''return FormField<Weather>(
  key: _key,
  enabled: widget.enabled,
  autovalidateMode: widget.autovalidateMode,
  validator: (value) => value == null ? 'required' : null,
  builder: (field) {
    final enabled = field.widget.enabled;

    void onChanged(Weather? value) {
      field.didChange(value);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: Weather.values.map((value) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  value: value,
                  groupValue: field.value,
                  onChanged: enabled ? onChanged : null,
                  toggleable: true,
                ),
                Text(
                  value.name,
                ),
              ],
            );
          }).toList(),
        ),
        _ErrorText(field.errorText),
      ],
    );
  },
)''';

  static const _codeFormFieldByExtend = '''class RadioFormField extends FormField<Weather> {
  RadioFormField({
    super.key,
    super.enabled,
    super.initialValue,
    super.autovalidateMode,
    super.restorationId,
    super.validator,
  }) : super(
          builder: (field) {
            final context = field.context;

            final enabled = field.widget.enabled;

            void onChanged(Weather? value) {
              field.didChange(value);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: Weather.values.map((value) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: value,
                          groupValue: field.value,
                          onChanged: enabled ? onChanged : null,
                          toggleable: true,
                        ),
                        Text(
                          value.name,
                        ),
                      ],
                    );
                  }).toList(),
                ),
                _ErrorText(field.errorText),
              ],
            );
          },
        );
}''';
}
