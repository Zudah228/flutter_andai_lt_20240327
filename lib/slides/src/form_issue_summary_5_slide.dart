import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../components/extended_flutter_deck_bullet_list.dart';
import '../../components/subtitle.dart';

class FormIssueSummary5Slide extends FlutterDeckSlideWidget {
  FormIssueSummary5Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/form_issue_summary_5',
            title: 'Formが抱える問題 ⑦',
            header: FlutterDeckHeaderConfiguration(
              title: 'Formが抱える問題 ⑦',
            ),
            steps: 2,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return FlutterDeckSlideStepsBuilder(
          builder: (context, steps) {
            final theme = FlutterDeckTheme.of(context);
            final colorScheme = theme.materialTheme.colorScheme;
            final textHighlightColor =
                steps == 1 ? null : colorScheme.errorContainer;

            TextSpan textSpan({
              required String text,
              bool highlight = false,
            }) {
              return TextSpan(
                text: text,
                style: TextStyle(
                  backgroundColor: highlight ? textHighlightColor : null,
                ),
              );
            }

            return FlutterDeckSubtitledComponent(
              subtitle: 'Form をサポートしているウィジェットが、あまりにも少ない',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '例：HTML の input の型',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const Text(
                    'https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#input_types',
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Expanded(
                          child: ExtendedFlutterDeckBulletList(
                            items: [
                              textSpan(
                                text: 'email',
                              ),
                              textSpan(
                                text: 'checkbox',
                                highlight: true,
                              ),
                              textSpan(
                                text: 'color',
                                highlight: true,
                              ),
                              textSpan(
                                text: 'datetime',
                                highlight: true,
                              ),
                              textSpan(
                                text: 'date',
                                highlight: true,
                              ),
                              textSpan(
                                text: 'file',
                                highlight: true,
                              ),
                              textSpan(
                                text: 'image',
                              ),
                              textSpan(
                                text: 'month',
                              ),
                              textSpan(
                                text: 'number',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: ExtendedFlutterDeckBulletList(
                          items: [
                            textSpan(
                              text: 'password',
                            ),
                            textSpan(
                              text: 'radio',
                              highlight: true,
                            ),
                            textSpan(
                              text: 'range',
                              highlight: true,
                            ),
                            textSpan(
                              text: 'search',
                            ),
                            textSpan(
                              text: 'tel',
                            ),
                            textSpan(
                              text: 'text',
                            ),
                            textSpan(
                              text: 'time',
                              highlight: true,
                            ),
                            textSpan(
                              text: 'url',
                            ),
                            textSpan(text: 'week'),
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
