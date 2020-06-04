import 'dart:math';

import 'package:flutter/material.dart';

extension NumberSupport on num {
  ///create new SizedBox with height = value.
  ///
  ///warning: use const SizedBox if you want to create const Widget
  SizedBox get height {
    return SizedBox(
      height: toDouble(),
    );
  }

  ///create new SizedBox with width = value.
  ///
  ///warning: use const SizedBox() if you want to create const Widget
  SizedBox get width {
    return SizedBox(
      width: toDouble(),
    );
  }
}

extension IntSupport on int {
  /// Generates a non-negative random integer uniformly distributed in the range
  /// from 0, inclusive, to [max], exclusive.
  ///
  /// Implementation note: The default implementation supports [max] values
  /// between 1 and (1<<32) inclusive.
  int get random {
    final rd = Random();
    return rd.nextInt(this);
  }

  /// return Duration with minutes = value
  Duration get minutes {
    return Duration(minutes: this);
  }

  /// return Duration with hours = value
  Duration get hours {
    return Duration(hours: this);
  }

  /// return Duration with days = value
  Duration get days {
    return Duration(days: this);
  }
}
