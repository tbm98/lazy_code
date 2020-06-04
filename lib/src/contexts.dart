import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../lazy_code.dart';
import 'config/route_type.dart';

extension ContextSupport on BuildContext {
  /************************** Get sizes *********************************/

  ///get width of fullscreen by percent
  double getW([double percent = 100]) {
    return percent / 100.0 * MediaQuery.of(this).size.width;
  }

  ///get height of fullscreen(contains appbar and bottom bar) by percent
  double getH([double percent = 100]) {
    return percent / 100.0 * MediaQuery.of(this).size.height;
  }

  ///get Height of screen without app by percent
  double getHWithoutAppbar([double percent = 100]) {
    return percent /
        100.0 *
        (MediaQuery.of(this).size.height - Scaffold.of(this).appBarMaxHeight);
  }

  ///get Height of screen without appbar and bottomNavigationBar by percent
  double getHWithoutAppbarAndBottomNaviBar([double percent = 100]) {
    return percent /
        100.0 *
        (MediaQuery.of(this).size.height -
            Scaffold.of(this).appBarMaxHeight -
            kBottomNavigationBarHeight);
  }

  /************************** Actions *********************************/

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
  Future<dynamic> push(Widget Function(BuildContext context) builder) {
    if (routeTypeDefault == RouteType.cupertino) {
      return Navigator.of(this).push(CupertinoPageRoute(builder: builder));
    } else {
      return Navigator.of(this).push(MaterialPageRoute(builder: builder));
    }
  }

  /// Call to Navigator.of(context).pop()
  void pop<T extends Object>([T result]) {
    Navigator.of(this).pop(result);
  }

  /// Call to Navigator.of(context).popUntil => route.isFirst
  void popToRoot() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }

  /// Get theme data by Theme.of(context)
  ThemeData get theme {
    return Theme.of(this);
  }
}