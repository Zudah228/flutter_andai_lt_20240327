import 'package:flutter/material.dart';

/// [InputDecorator] で実装されているアニメーション設定
const Duration _kTransitionDuration = Duration(milliseconds: 167);

/// [InputDecorator] で実装されているアニメーション設定
const Curve _kTransitionCurve = Curves.fastOutSlowIn;

class ErrorText extends StatefulWidget {
  const ErrorText(this.errorText, {super.key});

  final String? errorText;

  @override
  State<ErrorText> createState() => ErrorTextState();
}

class ErrorTextState extends State<ErrorText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _opacity;
  late final Animation<double> _heightFactor;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: _kTransitionDuration);
    _opacity = _animationController.drive(
      Tween(begin: 0, end: 1)..chain(CurveTween(curve: _kTransitionCurve)),
    );
    _heightFactor = _animationController.drive(
      Tween(begin: 0, end: 1)..chain(CurveTween(curve: _kTransitionCurve)),
    );

    if (widget.errorText != null) {
      _animationController.forward();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ErrorText oldWidget) {
    if (widget.errorText == null) {
      _animationController.value = 0;
    }
    if (widget.errorText != oldWidget.errorText && widget.errorText != null) {
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var effectiveStyle = theme.inputDecorationTheme.errorStyle ??
        theme.textTheme.bodySmall ??
        const TextStyle();

    effectiveStyle = effectiveStyle.copyWith(
      color: theme.colorScheme.error,
    );

    final textDirection = Directionality.of(context);
    final padding = switch (textDirection) {
      TextDirection.rtl => const EdgeInsets.only(right: 8),
      TextDirection.ltr => const EdgeInsets.only(left: 8),
    };
    final alignment = switch (textDirection) {
      TextDirection.rtl => AlignmentDirectional.centerEnd,
      TextDirection.ltr => AlignmentDirectional.centerStart,
    };

    return FadeTransition(
      opacity: _opacity,
      child: AnimatedBuilder(
        animation: _heightFactor,
        builder: (context, child) {
          return Align(
            alignment: alignment,
            heightFactor: _heightFactor.value,
            child: child,
          );
        },
        child: Padding(
          padding: padding,
          child: Text(widget.errorText ?? '', style: effectiveStyle),
        ),
      ),
    );
  }
}
