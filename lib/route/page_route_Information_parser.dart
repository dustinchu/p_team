import 'package:flutter/material.dart';

import 'route_path.dart';

class PageRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // print("parser==${uri.pathSegments.length} parser2 ===${uri.pathSegments.first}");
    // Handle '/'
    print("3");
    if (uri.pathSegments.length == 0) {
      return RoutePath.home();
    }
    print("url0===${uri.pathSegments[0]}");
    // Handle '/book/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'book') return RoutePath.unknown();
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id == null) return RoutePath.unknown();
      print("id===${id}");
      return RoutePath.details(id);
    } else {
      switch (uri.pathSegments[0]) {
        case "about":
          print("?");
          return RoutePath.page("about");
          break;
        default:
      }
    }

    // Handle unknown routes
    return RoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath path) {
    print("2");
    if (path.pageID == "about") {
      return RouteInformation(location: '/about');
    }
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/book/${path.id}');
    }
    return null;
  }
}
