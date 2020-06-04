import 'package:flutter/material.dart';

import '../../lazy_code.dart';


/// return a SizedBox with width = width of screen * percent / 100
class WidthOfScreen extends StatelessWidget {
  const WidthOfScreen({@required this.percent, @required this.child})
      : assert(percent != null && child != null);

  final double percent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Width(
      context.getW(percent),
      child: child,
    );
  }
}
