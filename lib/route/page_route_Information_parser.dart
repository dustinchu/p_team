import 'package:flutter/material.dart';

import 'route_path.dart';

class PageRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // print("parser==${uri.pathSegments.length} parser2 ===${uri.pathSegments.first}");
    // Handle '/'
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
          return RoutePath.page("about");
        case "contact":
          return RoutePath.page("contact");
        case "product":
          return RoutePath.page("product");
        case "login":
          return RoutePath.page("login");
        case "shopping":
          return RoutePath.page("shopping");
          break;
        default:
      }
    }

    // Handle unknown routes
    return RoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath path) {
    if (path.pageID == "about") {
      return RouteInformation(location: '/about');
    }
    if (path.pageID == "contact") {
      return RouteInformation(location: '/contact');
    }
    if (path.pageID == "product") {
      return RouteInformation(location: '/product');
    }
    if (path.pageID == "login") {
      return RouteInformation(location: '/login');
    }
    if (path.pageID == "shopping") {
      return RouteInformation(location: '/shopping');
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
