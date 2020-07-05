import 'package:flutter/material.dart';
import 'package:lazy_code/src/extensions/contexts.dart';

Future<dynamic> push(
    BuildContext context, Widget Function(BuildContext context) builder) {
  return context.push(builder);
}

void pop<T extends Object>(BuildContext context, [T result]) {
  context.pop(result);
}
