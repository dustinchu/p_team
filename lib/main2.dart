import 'package:flutter/material.dart';

import 'route/page_route_Information_parser.dart';
import 'route/page_router_delegate.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  PageRouterDelegate _routerDelegate = PageRouterDelegate();
  PageRouteInformationParser _routeInformationParser =
      PageRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    print("1");
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor:Colors.orange,
        brightness: Brightness.dark,
      ),
      title: 'P.team',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
