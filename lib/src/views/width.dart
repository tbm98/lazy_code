import 'package:flutter/material.dart';

/// Create SizedBox with width = value
///
/// It's support create const Widget
class Width extends SizedBox {
  const Width(double value, {Widget child})
      : assert(value != null),
        super(width: value, child: child);
}
