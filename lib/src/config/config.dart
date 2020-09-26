import 'route_type.dart';

RouteType _routeTypeDefault = RouteType.material;

RouteType get routeTypeDefault => _routeTypeDefault;

class CodeFasterConfig {
  /// If you want to use MaterialPageRoute by default
  /// you must set useMaterial:true
  ///
  /// If you want to use CupertinoPageRoute by default,
  /// you don't need to call this function because
  /// It was used CupertinoPageRoute by default
  static void setPageRouteType({bool useMaterial}) {
    if (useMaterial) {
      _routeTypeDefault = RouteType.material;
    } else {
      _routeTypeDefault = RouteType.cupertino;
    }
  }
}
