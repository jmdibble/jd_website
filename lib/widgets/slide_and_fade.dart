import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum SlideDirection {
  Top,
  Bottom,
  Left,
  Right,
}

class SlideAndFade extends StatelessWidget {
  final double delay;
  final Widget child;
  final bool withSlide;
  final SlideDirection direction;

  SlideAndFade(
      {this.delay,
      this.child,
      this.withSlide = true,
      this.direction = SlideDirection.Right});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateX").add(
          Duration(milliseconds: 500), Tween(begin: 130.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: withSlide
            ? Transform.translate(
                offset: Offset(
                  direction == SlideDirection.Right
                      ? animation["translateX"]
                      : direction == SlideDirection.Left
                          ? -animation["translateX"]
                          : 0,
                  direction == SlideDirection.Bottom
                      ? animation["translateX"]
                      : direction == SlideDirection.Top
                          ? -animation["translateX"]
                          : 0,
                ),
                child: child)
            : child,
      ),
    );
  }
}
