import 'package:flutter/material.dart';
import 'package:lazy_code/src/extensions/contexts.dart';

/// Call to navigator.of(context).push()
/// and use CupertinoPageRoute by default
/// because I prefer to use Cupertino over material :D
///
/// ex: context.push((context)=>SecondPage());
///
/// you can call setRouteTypeDefault(RouteType type) to
/// set default to MaterialPageRoute or CupertinoPageRoute
///
/// by default: I use CupertinoPageRoute
Future<dynamic> push(
    BuildContext context, Widget Function(BuildContext context) builder) {
  return context.push(builder);
}

/// Replace the current route of the navigator by pushing the given route and
/// then disposing the previous route once the new route has finished
/// animating in.
///
/// {@macro flutter.widgets.navigator.pushReplacement}
///
/// {@tool snippet}
///
/// Typical usage is as follows:
///
/// ```dart
/// void _doOpenPage() {
///   pushReplacement(context,(context) => MyHomePage()));
/// }
/// ```
/// {@end-tool}
Future<dynamic> pushReplacement<TO extends Object>(
    BuildContext context, Widget Function(BuildContext context) builder,
    {TO result}) {
  return context.pushReplacement(builder, result: result);
}

/// Call to Navigator.of(context).pop()
void pop<T extends Object>(BuildContext context, [T result]) {
  context.pop(result);
}

/// Call to Navigator.of(context).popUntil => route.isFirst
void popToRoot(BuildContext context) {
  context.popToRoot();
}
