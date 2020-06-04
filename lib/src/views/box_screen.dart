import 'package:flutter/material.dart';
import 'package:lazy_code/lazy_code.dart';

/// create a SizedBox with widthPercent & heightPercent of screen
class BoxOfScreen extends StatelessWidget {
  const BoxOfScreen(
      {@required this.widthPercent,
      @required this.heightPercent,
      @required this.child})
      : assert(widthPercent != null && heightPercent != null && child != null);

  final double widthPercent;
  final double heightPercent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getW(widthPercent),
      height: context.getH(heightPercent),
      child: child,
    );
  }
}
