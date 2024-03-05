import 'package:flutter/material.dart';

/// Used to make shrink animations
class ElementShrinker extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool animateOnHover;

  const ElementShrinker({
    super.key,
    required this.child,
    this.onTap,
    this.animateOnHover = false,
  });

  @override
  State<ElementShrinker> createState() => _ElementShrinkerState();
}

class _ElementShrinkerState extends State<ElementShrinker>
    with SingleTickerProviderStateMixin {
  int clickAnimationDurationMillis = 100;
  double _scaleTransformValue = 1;
  bool isClicked = false;

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: clickAnimationDurationMillis),
      lowerBound: 0.0,
      upperBound: 0.10,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _shrinkButtonSize() {
    animationController.forward();
    isClicked = true;
  }

  void _restoreButtonSize() {
    Future.delayed(
      Duration(milliseconds: clickAnimationDurationMillis),
      () => animationController.reverse(),
    );
    isClicked = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      onHover: widget.animateOnHover
          ? (value) {
              if (value) {
                _shrinkButtonSize();
              } else {
                _restoreButtonSize();
              }
            }
          : null,
      onTap: () {
        Future.delayed(
          Duration(milliseconds: clickAnimationDurationMillis * 2),
          () => widget.onTap?.call(),
        );
        _shrinkButtonSize();
        _restoreButtonSize();
      },
      onTapDown: (_) => _shrinkButtonSize(),
      onTapCancel: _restoreButtonSize,
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: widget.child,
      ),
    );
  }
}
