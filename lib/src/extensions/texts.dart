import 'package:flutter/material.dart';

TextStyle styleOf([List<dynamic> styles, TextStyle from]) {
  TextStyle ts = from ??= const TextStyle();

  if (styles == null) {
    return ts;
  }

  for (final s in styles) {
    if (s is FontWeight) {
      ts = ts.copyWith(fontWeight: s);
    }
    if (s is Color) {
      ts = ts.apply(color: s);
    }
    if (s is num) {
      ts = ts.copyWith(fontSize: s.toDouble());
    }
    if (s is List) {
      ts = styleOf(s, ts);
    }
  }
  return ts;
}

extension TextSupport on Text {
  Text withs(List<dynamic> styles) {
    final TextStyle ts = styleOf(styles, style);
    return Text(
      data,
      key: key,
      style: ts,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
    );
  }
}

extension TextStyleSupport on TextStyle {
  TextStyle withs(List<dynamic> styles) {
    final TextStyle ts = styleOf(styles, this);
    return ts;
  }
}
