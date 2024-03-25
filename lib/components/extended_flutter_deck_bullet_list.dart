import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

/// A widget that renders a list of bullet points.
///
/// Bullet point [items] are rendered as a row with a bullet point and the text.
/// The bullet point is rendered as a dot by default, but can be customized by
/// providing a [bulletPointWidget]. The text is rendered as an [AutoSizeText]
/// widget and is automatically resized to fit the available space.
///
/// If [useSteps] is true, the bullet points will be rendered one by one as the
/// user steps through the slide. To use this feature, define the number of
/// steps in the slide configuration.
///
/// Example:
///
/// ```dart
/// import 'package:flutter/material.dart';
/// import 'package:flutter_deck/flutter_deck.dart';
///
/// class BulletListSlide extends FlutterDeckSlideWidget {
///   const BulletListSlide()
///       : super(
///           configuration: const FlutterDeckSlideConfiguration(
///             route: '/bullet-list',
///             steps: 3,
///           ),
///         );
///
///   @override
///   FlutterDeckSlide build(BuildContext context) {
///     return FlutterDeckSlide.custom(
///       builder: (context) => ExtendedFlutterDeckBulletList(
///         useSteps: true,
///         items: const [
///           'Bullet point 1',
///           'Bullet point 2',
///           'Bullet point 3',
///         ],
///       ),
///     );
///   }
/// }
/// ```
class ExtendedFlutterDeckBulletList extends StatefulWidget {
  /// Creates a widget that renders a list of bullet points.
  ///
  /// Bullet point [items] are rendered as a row with a bullet point and the
  /// text. The bullet point is rendered as a dot by default, but can be
  /// customized by providing a [bulletPointWidget].
  ///
  /// If [useSteps] is true, the bullet points will be rendered one by one as
  /// the user steps through the slide. By default, it is false.
  ///
  /// At least one bullet point must be provided.
  ExtendedFlutterDeckBulletList({
    this.items = const [],
    this.useSteps = false,
    this.stepOffset = 0,
    this.bulletPointWidget,
    this.bulletPointText,
    super.key,
  }) : assert(items.isNotEmpty, 'You must provide at least one bullet point.');

  /// A list of bullet points.
  final List<String> items;

  /// Whether to render the bullet points one by one as the user steps through
  /// the slide.
  final bool useSteps;

  /// Use this to offset the step number for the first item in the list. This
  /// can be used to start showing [items] later in a slide. For instance, when
  /// you have two bullet lists on the same slide, and you want to show the
  /// second list after the first one.
  ///
  /// If the value is `1`, the first item in the list will not be shown
  /// directly.
  ///
  /// If the value is negative, you can show more than just the first item
  /// directly.
  ///
  /// Default is `0` (no offset).
  final int stepOffset;

  /// A widget to use as the bullet point. If not provided, a dot will be used.
  final Widget? bulletPointWidget;
  final String? bulletPointText;

  @override
  State<ExtendedFlutterDeckBulletList> createState() =>
      _ExtendedFlutterDeckBulletListState();
}

class _ExtendedFlutterDeckBulletListState
    extends State<ExtendedFlutterDeckBulletList> {
  final _autoSizeGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    if (!widget.useSteps) {
      return _BulletList(
        items: widget.items,
        autoSizeGroup: _autoSizeGroup,
        bulletPointWidget: widget.bulletPointWidget,
        bulletPointText: widget.bulletPointText,
      );
    }

    return FlutterDeckSlideStepsBuilder(
      builder: (context, stepNumber) => _BulletList(
        items: widget.items,
        autoSizeGroup: _autoSizeGroup,
        bulletPointWidget: widget.bulletPointWidget,
        bulletPointText: widget.bulletPointText,
        stepNumber: stepNumber - widget.stepOffset,
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList({
    required this.items,
    required this.autoSizeGroup,
    this.bulletPointWidget,
    this.stepNumber,
    this.bulletPointText,
  });

  final List<String> items;
  final AutoSizeGroup autoSizeGroup;
  final Widget? bulletPointWidget;
  final String? bulletPointText;
  final int? stepNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < items.length; i++)
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _BulletListItem(
                group: autoSizeGroup,
                text: items[i],
                visible: stepNumber == null ||
                    stepNumber != null && i + 1 <= stepNumber!,
                bulletPointWidget: bulletPointWidget,
                bulletPointText: bulletPointText,
              ),
            ),
          ),
      ],
    );
  }
}

class _BulletListItem extends StatelessWidget {
  const _BulletListItem({
    required this.group,
    required this.text,
    required this.visible,
    this.bulletPointWidget,
    this.bulletPointText,
  });

  final AutoSizeGroup group;
  final String text;
  final bool visible;
  final Widget? bulletPointWidget;
  final String? bulletPointText;

  @override
  Widget build(BuildContext context) {
    return Visibility.maintain(
      visible: visible,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bulletPointWidget ??
              _AutoSizeText(
                bulletPointText ?? '\u2022',
                group: group,
              ),
          const SizedBox(width: 8),
          Expanded(
            child: _AutoSizeText(text, group: group),
          ),
        ],
      ),
    );
  }
}

class _AutoSizeText extends StatelessWidget {
  const _AutoSizeText(
    this.text, {
    required this.group,
  });

  final AutoSizeGroup group;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterDeckBulletListTheme.of(context);
    final textStyle = theme.textStyle ?? const TextStyle();

    return AutoSizeText(
      text,
      group: group,
      style: textStyle.copyWith(
        color: theme.color,
      ),
      maxFontSize: textStyle.fontSize ?? double.infinity,
    );
  }
}
