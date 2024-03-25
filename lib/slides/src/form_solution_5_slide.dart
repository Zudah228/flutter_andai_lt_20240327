import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

import '../../components/form_management_buttons.dart';
import '../../components/radio_form_field.dart';

class FormSolution5Slide extends FlutterDeckSlideWidget {
  FormSolution5Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_solution_5_slide',
            title: '解決策 - 2 FormField を自作する④',
            header: FlutterDeckHeaderConfiguration(
              title: '解決策 - 2 FormField を自作する④',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    final items = Weather.values
        .map((e) => RadioFieldItem(label: e.name, value: e))
        .toList();

    return FlutterDeckSlide.blank(
      builder: (context) {
        return Row(
          children: [
            Expanded(
              flex: 3,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: const FittedBox(
                        child: FlutterDeckCodeHighlight(
                          code: _code,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const FormManagementButtons(),
                      const Gap(16),
                      RadioFormField(
                        items: items,
                        validator: (value) => value == null ? '必須です' : null,
                      ),
                      const Gap(8),
                      RadioFormField(
                        items: items,
                        validator: (value) => value == null
                            ? '必須です'
                            : value == Weather.rainy
                                ? '雨じゃないです'
                                : null,
                      ),
                      const Gap(8),
                      RadioFormField(
                        initialValue: Weather.sunny,
                        items: items,
                        validator: (value) => value == null ? '必須です' : null,
                      ),
                      const Gap(8),
                      RadioFormField(
                        items: items,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value == null
                            ? '必須です'
                            : value == Weather.rainy
                                ? '雨じゃないです'
                                : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static const _code = '''
@immutable
class RadioFieldItem<T> {
  const RadioFieldItem({required this.label, required this.value});

  final String label;
  final T value;
}

class RadioFormField<T extends Object> extends FormField<T> {
  RadioFormField({
    super.key,
    required this.items,
    super.enabled,
    super.initialValue,
    super.autovalidateMode,
    super.restorationId,
    super.validator,
  }) : super(
          builder: (field) {
            final context = field.context;

            final enabled = field.widget.enabled;

            void onChanged(T? value) {
              field.didChange(value);
            }

            Color? getEffectiveTextColor(
              ThemeData themeData, {
              required bool selected,
            }) {
              return selected
                  ? (themeData.radioTheme.fillColor
                          ?.resolve({MaterialState.selected}) ??
                      themeData.colorScheme.primary)
                  : themeData.colorScheme.onBackground
                      .withOpacity(enabled ? 1.0 : 0.6);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  children: items.map((item) {
                    final selected = item.value == field.value;

                    final textColor = getEffectiveTextColor(
                      Theme.of(context),
                      selected: selected,
                    );

                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<T>(
                          value: item.value,
                          groupValue: field.value,
                          onChanged: enabled ? onChanged : null,
                          toggleable: true,
                        ),
                        Text(
                          item.label,
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                ErrorText(field.errorText),
              ],
            );
          },
        );

  final List<RadioFieldItem<T>> items;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(DiagnosticsProperty('items', items));
    super.debugFillProperties(properties);
  }
}
''';
}
