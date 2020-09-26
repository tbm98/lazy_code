import 'package:flutter/material.dart';
import 'package:lazy_code/src/extensions/contexts.dart';

/// Call to navigator.of(context).push()
/// and use MaterialPageRoute by default
///
/// ex: context.push((context)=>SecondPage());
///
/// you can call setRouteTypeDefault(RouteType type) to
/// set default to MaterialPageRoute or CupertinoPageRoute
Future<dynamic> push(
    BuildContext context, Widget Function(BuildContext context) builder,
    {String name}) {
  return context.push(builder, name: name);
}

/// Call to Navigator.of(context).popUntil => route.isFirst
void popToRoot(BuildContext context) {
  context.popToRoot();
}

/// Push a named route onto the navigator that most tightly encloses the given
/// context.
///
/// {@template flutter.widgets.navigator.pushNamed}
/// The route name will be passed to that navigator's [onGenerateRoute]
/// callback. The returned route will be pushed into the navigator.
///
/// The new route and the previous route (if any) are notified (see
/// [Route.didPush] and [Route.didChangeNext]). If the [Navigator] has any
/// [Navigator.observers], they will be notified as well (see
/// [NavigatorObserver.didPush]).
///
/// Ongoing gestures within the current route are canceled when a new route is
/// pushed.
///
/// Returns a [Future] that completes to the `result` value passed to [pop]
/// when the pushed route is popped off the navigator.
///
/// The `T` type argument is the type of the return value of the route.
///
/// To use [pushNamed], an [onGenerateRoute] callback must be provided,
/// {@endtemplate}
///
/// {@template flutter.widgets.navigator.pushNamed.arguments}
/// The provided `arguments` are passed to the pushed route via
/// [RouteSettings.arguments]. Any object can be passed as `arguments` (e.g. a
/// [String], [int], or an instance of a custom `MyRouteArguments` class).
/// Often, a [Map] is used to pass key-value pairs.
///
/// The `arguments` may be used in [Navigator.onGenerateRoute] or
/// [Navigator.onUnknownRoute] to construct the route.
/// {@endtemplate}
///
/// {@tool snippet}
///
/// Typical usage is as follows:
///
/// ```dart
/// void _didPushButton() {
///   Navigator.pushNamed(context, '/settings');
/// }
/// ```
/// {@end-tool}
///
/// {@tool snippet}
///
/// The following example shows how to pass additional `arguments` to the
/// route:
///
/// ```dart
/// void _showBerlinWeather() {
///   Navigator.pushNamed(
///     context,
///     '/weather',
///     arguments: <String, String>{
///       'city': 'Berlin',
///       'country': 'Germany',
///     },
///   );
/// }
/// ```
/// {@end-tool}
///
/// {@tool snippet}
///
/// The following example shows how to pass a custom Object to the route:
///
/// ```dart
/// class WeatherRouteArguments {
///   WeatherRouteArguments({ this.city, this.country });
///   final String city;
///   final String country;
///
///   bool get isGermanCapital {
///     return country == 'Germany' && city == 'Berlin';
///   }
/// }
///
/// void _showWeather() {
///   Navigator.pushNamed(
///     context,
///     '/weather',
///     arguments: WeatherRouteArguments(city: 'Berlin', country: 'Germany'),
///   );
/// }
/// ```
/// {@end-tool}
Future<T> pushNamed<T extends Object>(BuildContext context, String routeName,
    {Object arguments}) {
  return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments);
}

///////////////////////////////////////////////////////////////////////////////

/// Replace the current route of the navigator that most tightly encloses the
/// given context by pushing the route named [routeName] and then disposing
/// the previous route once the new route has finished animating in.
///
/// {@template flutter.widgets.navigator.pushReplacementNamed}
/// If non-null, `result` will be used as the result of the route that is
/// removed; the future that had been returned from pushing that old route
/// will complete with `result`. Routes such as dialogs or popup menus
/// typically use this mechanism to return the value selected by the user to
/// the widget that created their route. The type of `result`, if provided,
/// must match the type argument of the class of the old route (`TO`).
///
/// The route name will be passed to the navigator's [onGenerateRoute]
/// callback. The returned route will be pushed into the navigator.
///
/// The new route and the route below the removed route are notified (see
/// [Route.didPush] and [Route.didChangeNext]). If the [Navigator] has any
/// [Navigator.observers], they will be notified as well (see
/// [NavigatorObserver.didReplace]). The removed route is notified once the
/// new route has finished animating (see [Route.didComplete]). The removed
/// route's exit animation is not run (see [popAndPushNamed] for a variant
/// that does animated the removed route).
///
/// Ongoing gestures within the current route are canceled when a new route is
/// pushed.
///
/// Returns a [Future] that completes to the `result` value passed to [pop]
/// when the pushed route is popped off the navigator.
///
/// The `T` type argument is the type of the return value of the new route,
/// and `TO` is the type of the return value of the old route.
///
/// To use [pushReplacementNamed], an [onGenerateRoute] callback must be
/// provided.
/// {@endtemplate}
///
/// {@macro flutter.widgets.navigator.pushNamed.arguments}
///
/// {@tool snippet}
///
/// Typical usage is as follows:
///
/// ```dart
/// void _switchToBrightness() {
///   Navigator.pushReplacementNamed(context, '/settings/brightness');
/// }
/// ```
/// {@end-tool}
Future<T> pushReplacementNamed<T extends Object, TO extends Object>(
  BuildContext context,
  String routeName, {
  TO result,
  Object arguments,
}) {
  return Navigator.of(context).pushReplacementNamed<T, TO>(routeName,
      arguments: arguments, result: result);
}

/// Pop the current route off the navigator that most tightly encloses the
/// given context and push a named route in its place.
///
/// {@template flutter.widgets.navigator.popAndPushNamed}
/// The popping of the previous route is handled as per [pop].
///
/// The new route's name will be passed to the navigator's [onGenerateRoute]
/// callback. The returned route will be pushed into the navigator.
///
/// The new route, the old route, and the route below the old route (if any)
/// are all notified (see [Route.didPop], [Route.didComplete],
/// [Route.didPopNext], [Route.didPush], and [Route.didChangeNext]). If the
/// [Navigator] has any [Navigator.observers], they will be notified as well
/// (see [NavigatorObserver.didPop] and [NavigatorObservers.didPush]). The
/// animations for the pop and the push are performed simultaneously, so the
/// route below may be briefly visible even if both the old route and the new
/// route are opaque (see [TransitionRoute.opaque]).
///
/// Ongoing gestures within the current route are canceled when a new route is
/// pushed.
///
/// Returns a [Future] that completes to the `result` value passed to [pop]
/// when the pushed route is popped off the navigator.
///
/// The `T` type argument is the type of the return value of the new route,
/// and `TO` is the return value type of the old route.
///
/// To use [popAndPushNamed], an [onGenerateRoute] callback must be provided.
///
/// {@endtemplate}
///
/// {@macro flutter.widgets.navigator.pushNamed.arguments}
///
/// {@tool snippet}
///
/// Typical usage is as follows:
///
/// ```dart
/// void _selectAccessibility() {
///   Navigator.popAndPushNamed(context, '/settings/accessibility');
/// }
/// ```
/// {@end-tool}
Future<T> popAndPushNamed<T extends Object, TO extends Object>(
  BuildContext context,
  String routeName, {
  TO result,
  Object arguments,
}) {
  return Navigator.of(context)
      .popAndPushNamed<T, TO>(routeName, arguments: arguments, result: result);
}

/// Push the route with the given name onto the navigator that most tightly
/// encloses the given context, and then remove all the previous routes until
/// the `predicate` returns true.
///
/// {@template flutter.widgets.navigator.pushNamedAndRemoveUntil}
/// The predicate may be applied to the same route more than once if
/// [Route.willHandlePopInternally] is true.
///
/// To remove routes until a route with a certain name, use the
/// [RoutePredicate] returned from [ModalRoute.withName].
///
/// To remove all the routes below the pushed route, use a [RoutePredicate]
/// that always returns false (e.g. `(Route<dynamic> route) => false`).
///
/// The removed routes are removed without being completed, so this method
/// does not take a return value argument.
///
/// The new route's name (`routeName`) will be passed to the navigator's
/// [onGenerateRoute] callback. The returned route will be pushed into the
/// navigator.
///
/// The new route and the route below the bottommost removed route (which
/// becomes the route below the new route) are notified (see [Route.didPush]
/// and [Route.didChangeNext]). If the [Navigator] has any
/// [Navigator.observers], they will be notified as well (see
/// [NavigatorObservers.didPush] and [NavigatorObservers.didRemove]). The
/// removed routes are disposed, without being notified, once the new route
/// has finished animating. The futures that had been returned from pushing
/// those routes will not complete.
///
/// Ongoing gestures within the current route are canceled when a new route is
/// pushed.
///
/// Returns a [Future] that completes to the `result` value passed to [pop]
/// when the pushed route is popped off the navigator.
///
/// The `T` type argument is the type of the return value of the new route.
///
/// To use [pushNamedAndRemoveUntil], an [onGenerateRoute] callback must be
/// provided.
/// {@endtemplate}
///
/// {@macro flutter.widgets.navigator.pushNamed.arguments}
///
/// {@tool snippet}
///
/// Typical usage is as follows:
///
/// ```dart
/// void _resetToCalendar() {
///   Navigator.pushNamedAndRemoveUntil(context, '/calendar', ModalRoute.withName('/'));
/// }
/// ```
/// {@end-tool}
Future<T> pushNamedAndRemoveUntil<T extends Object>(
  BuildContext context,
  String newRouteName,
  RoutePredicate predicate, {
  Object arguments,
}) {
  return Navigator.of(context).pushNamedAndRemoveUntil<T>(
      newRouteName, predicate,
      arguments: arguments);
}

/// Replace the current route of the navigator that most tightly encloses the
/// given context by pushing the given route and then disposing the previous
/// route once the new route has finished animating in.
///
/// {@template flutter.widgets.navigator.pushReplacement}
/// If non-null, `result` will be used as the result of the route that is
/// removed; the future that had been returned from pushing that old route will
/// complete with `result`. Routes such as dialogs or popup menus typically
/// use this mechanism to return the value selected by the user to the widget
/// that created their route. The type of `result`, if provided, must match
/// the type argument of the class of the old route (`TO`).
///
/// The new route and the route below the removed route are notified (see
/// [Route.didPush] and [Route.didChangeNext]). If the [Navigator] has any
/// [Navigator.observers], they will be notified as well (see
/// [NavigatorObserver.didReplace]). The removed route is notified once the
/// new route has finished animating (see [Route.didComplete]).
///
/// Ongoing gestures within the current route are canceled when a new route is
/// pushed.
///
/// Returns a [Future] that completes to the `result` value passed to [pop]
/// when the pushed route is popped off the navigator.
///
/// The `T` type argument is the type of the return value of the new route,
/// and `TO` is the type of the return value of the old route.
/// {@endtemplate}
///
/// {@tool snippet}
///
/// Typical usage is as follows:
///
/// ```dart
/// void _completeLogin() {
///   Navigator.pushReplacement(
///       context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
/// }
/// ```
/// {@end-tool}

Future<T> pushReplacement<T extends Object, TO extends Object>(
    BuildContext context, Route<T> newRoute,
    {TO result}) {
  return Navigator.of(context).pushReplacement<T, TO>(newRoute, result: result);
}

/// Push the given route onto the navigator that most tightly encloses the
/// given context, and then remove all the previous routes until the
/// `predicate` returns true.
///
/// {@template flutter.widgets.navigator.pushAndRemoveUntil}
/// The predicate may be applied to the same route more than once if
/// [Route.willHandlePopInternally] is true.
///
/// To remove routes until a route with a certain name, use the
/// [RoutePredicate] returned from [ModalRoute.withName].
///
/// To remove all the routes below the pushed route, use a [RoutePredicate]
/// that always returns false (e.g. `(Route<dynamic> route) => false`).
///
/// The removed routes are removed without being completed, so this method
/// does not take a return value argument.
///
/// The newly pushed route and its preceding route are notified for
/// [Route.didPush]. After removal, the new route and its new preceding route,
/// (the route below the bottommost removed route) are notified through
/// [Route.didChangeNext]). If the [Navigator] has any [Navigator.observers],
/// they will be notified as well (see [NavigatorObservers.didPush] and
/// [NavigatorObservers.didRemove]). The removed routes are disposed of and
/// notified, once the new route has finished animating. The futures that had
/// been returned from pushing those routes will not complete.
///
/// Ongoing gestures within the current route are canceled when a new route is
/// pushed.
///
/// Returns a [Future] that completes to the `result` value passed to [pop]
/// when the pushed route is popped off the navigator.
///
/// The `T` type argument is the type of the return value of the new route.
/// {@endtemplate}
///
/// {@tool snippet}
///
/// Typical usage is as follows:
///
/// ```dart
/// void _finishAccountCreation() {
///   Navigator.pushAndRemoveUntil(
///     context,
///     MaterialPageRoute(builder: (BuildContext context) => MyHomePage()),
///     ModalRoute.withName('/'),
///   );
/// }
/// ```
/// {@end-tool}
Future<T> pushAndRemoveUntil<T extends Object>(
    BuildContext context, Route<T> newRoute, RoutePredicate predicate) {
  return Navigator.of(context).pushAndRemoveUntil<T>(newRoute, predicate);
}

/// Replaces a route on the navigator that most tightly encloses the given
/// context with a new route.
///
/// {@template flutter.widgets.navigator.replace}
/// The old route must not be currently visible, as this method skips the
/// animations and therefore the removal would be jarring if it was visible.
/// To replace the top-most route, consider [pushReplacement] instead, which
/// _does_ animate the new route, and delays removing the old route until the
/// new route has finished animating.
///
/// The removed route is removed without being completed, so this method does
/// not take a return value argument.
///
/// The new route, the route below the new route (if any), and the route above
/// the new route, are all notified (see [Route.didReplace],
/// [Route.didChangeNext], and [Route.didChangePrevious]). If the [Navigator]
/// has any [Navigator.observers], they will be notified as well (see
/// [NavigatorObservers.didReplace]). The removed route is disposed without
/// being notified. The future that had been returned from pushing that routes
/// will not complete.
///
/// This can be useful in combination with [removeRouteBelow] when building a
/// non-linear user experience.
///
/// The `T` type argument is the type of the return value of the new route.
/// {@endtemplate}
///
/// See also:
///
///  * [replaceRouteBelow], which is the same but identifies the route to be
///    removed by reference to the route above it, rather than directly.
void replace<T extends Object>(
  BuildContext context, {
  @required Route<dynamic> oldRoute,
  @required Route<T> newRoute,
}) {
  return Navigator.of(context)
      .replace<T>(oldRoute: oldRoute, newRoute: newRoute);
}

/// Replaces a route on the navigator that most tightly encloses the given
/// context with a new route. The route to be replaced is the one below the
/// given `anchorRoute`.
///
/// {@template flutter.widgets.navigator.replaceRouteBelow}
/// The old route must not be current visible, as this method skips the
/// animations and therefore the removal would be jarring if it was visible.
/// To replace the top-most route, consider [pushReplacement] instead, which
/// _does_ animate the new route, and delays removing the old route until the
/// new route has finished animating.
///
/// The removed route is removed without being completed, so this method does
/// not take a return value argument.
///
/// The new route, the route below the new route (if any), and the route above
/// the new route, are all notified (see [Route.didReplace],
/// [Route.didChangeNext], and [Route.didChangePrevious]). If the [Navigator]
/// has any [Navigator.observers], they will be notified as well (see
/// [NavigatorObservers.didReplace]). The removed route is disposed without
/// being notified. The future that had been returned from pushing that routes
/// will not complete.
///
/// The `T` type argument is the type of the return value of the new route.
/// {@endtemplate}
///
/// See also:
///
///  * [replace], which is the same but identifies the route to be removed
///    directly.
void replaceRouteBelow<T extends Object>(BuildContext context,
    {@required Route<dynamic> anchorRoute, Route<T> newRoute}) {
  return Navigator.of(context)
      .replaceRouteBelow<T>(anchorRoute: anchorRoute, newRoute: newRoute);
}

/// Whether the navigator that most tightly encloses the given context can be
/// popped.
///
/// {@template flutter.widgets.navigator.canPop}
/// The initial route cannot be popped off the navigator, which implies that
/// this function returns true only if popping the navigator would not remove
/// the initial route.
///
/// If there is no [Navigator] in scope, returns false.
/// {@endtemplate}
///
/// See also:
///
///  * [Route.isFirst], which returns true for routes for which [canPop]
///    returns false.
bool canPop(BuildContext context) {
  final NavigatorState navigator = Navigator.of(context, nullOk: true);
  return navigator != null && navigator.canPop();
}

/// Consults the current route's [Route.willPop] method, and acts accordingly,
/// potentially popping the route as a result; returns whether the pop request
/// should be considered handled.
///
/// {@template flutter.widgets.navigator.maybePop}
/// If [Route.willPop] returns [RoutePopDisposition.pop], then the [pop]
/// method is called, and this method returns true, indicating that it handled
/// the pop request.
///
/// If [Route.willPop] returns [RoutePopDisposition.doNotPop], then this
/// method returns true, but does not do anything beyond that.
///
/// If [Route.willPop] returns [RoutePopDisposition.bubble], then this method
/// returns false, and the caller is responsible for sending the request to
/// the containing scope (e.g. by closing the application).
///
/// This method is typically called for a user-initiated [pop]. For example on
/// Android it's called by the binding for the system's back button.
///
/// The `T` type argument is the type of the return value of the current
/// route. (Typically this isn't known; consider specifying `dynamic` or
/// `Null`.)
/// {@endtemplate}
///
/// See also:
///
///  * [Form], which provides an `onWillPop` callback that enables the form
///    to veto a [pop] initiated by the app's back button.
///  * [ModalRoute], which provides a `scopedWillPopCallback` that can be used
///    to define the route's `willPop` method.
Future<bool> maybePop<T extends Object>(BuildContext context, [T result]) {
  return Navigator.of(context).maybePop<T>(result);
}

/// Pop the top-most route off the navigator that most tightly encloses the
/// given context.
///
/// {@template flutter.widgets.navigator.pop}
/// The current route's [Route.didPop] method is called first. If that method
/// returns false, then the route remains in the [Navigator]'s history (the
/// route is expected to have popped some internal state; see e.g.
/// [LocalHistoryRoute]). Otherwise, the rest of this description applies.
///
/// If non-null, `result` will be used as the result of the route that is
/// popped; the future that had been returned from pushing the popped route
/// will complete with `result`. Routes such as dialogs or popup menus
/// typically use this mechanism to return the value selected by the user to
/// the widget that created their route. The type of `result`, if provided,
/// must match the type argument of the class of the popped route (`T`).
///
/// The popped route and the route below it are notified (see [Route.didPop],
/// [Route.didComplete], and [Route.didPopNext]). If the [Navigator] has any
/// [Navigator.observers], they will be notified as well (see
/// [NavigatorObserver.didPop]).
///
/// The `T` type argument is the type of the return value of the popped route.
///
/// The type of `result`, if provided, must match the type argument of the
/// class of the popped route (`T`).
/// {@endtemplate}
///
/// {@tool snippet}
///
/// Typical usage for closing a route is as follows:
///
/// ```dart
/// void _close() {
///   Navigator.pop(context);
/// }
/// ```
/// {@end-tool}
///
/// A dialog box might be closed with a result:
///
/// ```dart
/// void _accept() {
///   Navigator.pop(context, true); // dialog returns true
/// }
/// ```
void pop<T extends Object>(BuildContext context, [T result]) {
  Navigator.of(context).pop<T>(result);
}

/// Calls [pop] repeatedly on the navigator that most tightly encloses the
/// given context until the predicate returns true.
///
/// {@template flutter.widgets.navigator.popUntil}
/// The predicate may be applied to the same route more than once if
/// [Route.willHandlePopInternally] is true.
///
/// To pop until a route with a certain name, use the [RoutePredicate]
/// returned from [ModalRoute.withName].
///
/// The routes are closed with null as their `return` value.
///
/// See [pop] for more details of the semantics of popping a route.
/// {@endtemplate}
///
/// {@tool snippet}
///
/// Typical usage is as follows:
///
/// ```dart
/// void _logout() {
///   Navigator.popUntil(context, ModalRoute.withName('/login'));
/// }
/// ```
/// {@end-tool}
void popUntil(BuildContext context, RoutePredicate predicate) {
  Navigator.of(context).popUntil(predicate);
}

/// Immediately remove `route` from the navigator that most tightly encloses
/// the given context, and [Route.dispose] it.
///
/// {@template flutter.widgets.navigator.removeRoute}
/// The removed route is removed without being completed, so this method does
/// not take a return value argument. No animations are run as a result of
/// this method call.
///
/// The routes below and above the removed route are notified (see
/// [Route.didChangeNext] and [Route.didChangePrevious]). If the [Navigator]
/// has any [Navigator.observers], they will be notified as well (see
/// [NavigatorObserver.didRemove]). The removed route is disposed without
/// being notified. The future that had been returned from pushing that routes
/// will not complete.
///
/// The given `route` must be in the history; this method will throw an
/// exception if it is not.
///
/// Ongoing gestures within the current route are canceled.
/// {@endtemplate}
///
/// This method is used, for example, to instantly dismiss dropdown menus that
/// are up when the screen's orientation changes.
void removeRoute(BuildContext context, Route<dynamic> route) {
  return Navigator.of(context).removeRoute(route);
}

/// Immediately remove a route from the navigator that most tightly encloses
/// the given context, and [Route.dispose] it. The route to be removed is the
/// one below the given `anchorRoute`.
///
/// {@template flutter.widgets.navigator.removeRouteBelow}
/// The removed route is removed without being completed, so this method does
/// not take a return value argument. No animations are run as a result of
/// this method call.
///
/// The routes below and above the removed route are notified (see
/// [Route.didChangeNext] and [Route.didChangePrevious]). If the [Navigator]
/// has any [Navigator.observers], they will be notified as well (see
/// [NavigatorObserver.didRemove]). The removed route is disposed without
/// being notified. The future that had been returned from pushing that routes
/// will not complete.
///
/// The given `anchorRoute` must be in the history and must have a route below
/// it; this method will throw an exception if it is not or does not.
///
/// Ongoing gestures within the current route are canceled.
/// {@endtemplate}
void removeRouteBelow(BuildContext context, Route<dynamic> anchorRoute) {
  return Navigator.of(context).removeRouteBelow(anchorRoute);
}
