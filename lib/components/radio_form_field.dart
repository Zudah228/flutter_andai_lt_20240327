import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'error_text.dart';

enum Weather {
  sunny,
  cloudy,
  rainy,
  snowy,
  ;
}

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
