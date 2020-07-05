import 'package:flutter/material.dart';
import 'package:lazy_code/src/extensions/contexts.dart';

Future<dynamic> push(
    BuildContext context, Widget Function(BuildContext context) builder) {
  return context.push(builder);
}

Future<dynamic> pushReplacement<TO extends Object>(
    BuildContext context, Widget Function(BuildContext context) builder,
    {TO result}) {
  return context.pushReplacement(builder, result: result);
}

void pop<T extends Object>(BuildContext context, [T result]) {
  context.pop(result);
}
