import 'package:date_time_form_field/date_time_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

import '../../components/form_management_buttons.dart';
import '../../components/linked_text.dart';
import '../../components/subtitle.dart';

class Outlook2Slide extends FlutterDeckSlideWidget {
  Outlook2Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/outlook_2_slide',
            title: '展望 ②',
            header: FlutterDeckHeaderConfiguration(
              title: '展望 ②',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return FlutterDeckSubtitledComponent(
          subtitle: 'DateTimeFormField パッケージ製作中',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LinkedText(
                url: 'https://github.com/Zudah228/date_time_form_field.git',
              ),
              const Gap(24),
              Expanded(
                child: Row(
                  children: [
                    const Expanded(
                      child: SingleChildScrollView(
                        child: FlutterDeckCodeHighlight(
                          code: _code,
                        ),
                      ),
                    ),
                    const Gap(32),
                    Expanded(
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.6,
                        child: Form(
                          child: Column(
                            children: [
                              const FormManagementButtons(),
                              const Gap(24),
                              DateTimeTextFormField(
                                validator: (value) =>
                                    value == null ? '必須です' : null,
                              ),
                              const Gap(16),
                              DateTimeTextFormField.materialPicker(
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 365),
                                ),
                                validator: (value) =>
                                    value == null ? '必須です' : null,
                              ),
                              const Gap(16),
                              DateTimeTextFormField.cupertinoPicker(
                                validator: (value) =>
                                    value == null ? '必須です' : null,
                              ),
                            ],
                          ),
                        ),
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

  static const _code = '''
Column(                                               
  children: [
    DateTimeTextFormField(
      validator: (value) =>
          value == null ? '必須です' : null,
    ),
    const Gap(16),
    DateTimeTextFormField.materialPicker(
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
      validator: (value) =>
          value == null ? '必須です' : null,
    ),
    const Gap(16),
    DateTimeTextFormField.cupertinoPicker(
      validator: (value) =>
          value == null ? '必須です' : null,
    ),
  ]
)''';
}
