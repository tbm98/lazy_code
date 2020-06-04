import 'package:flutter/material.dart';

import '../../lazy_code.dart';


/// return a SizedBox with height = height of screen * percent / 100
class HeightOfScreen extends StatelessWidget {
  const HeightOfScreen({@required this.percent, @required this.child})
      : assert(percent != null && child != null);

  final double percent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Height(
      context.getH(percent),
      child: child,
    );
  }
}
