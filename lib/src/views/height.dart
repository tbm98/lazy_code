import 'package:flutter/material.dart';

/// Create SizedBox with height = value
///
/// It's support create const Widget
class Height extends SizedBox {
  const Height(double value, {Widget child})
      : assert(value != null),
        super(height: value, child: child);
}
