import 'package:flutter/material.dart';
import 'package:p_team/model/product.dart';
import 'package:p_team/screens/about_screen.dart';
import 'package:p_team/screens/contact_screen.dart';
import 'package:p_team/screens/home/home_screen.dart';
import 'package:p_team/screens/login_screen.dart';
import 'package:p_team/screens/product.dart';
import 'package:p_team/screens/product_screen.dart';
import 'package:p_team/screens/shopping_screen.dart';
import 'package:p_team/screens/unknown_screen.dart';

import 'details_page.dart';
import 'route_path.dart';

class PageRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  Product _selectedBook;
  bool show404 = false;
  String pageID = "";
  List<Product> products = [
    Product('Stranger in a Strange Land', 'Robert A. Heinlein'),
    Product('Foundation', 'Isaac Asimov'),
    Product('Fahrenheit 451', 'Ray Bradbury'),
  ];

  PageRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

//
  RoutePath get currentConfiguration {
    print("７");
    if (show404) {
      return RoutePath.unknown();
    }
    if (pageID != "") {
      return RoutePath.page(pageID);
    }
    return _selectedBook == null
        ? RoutePath.home()
        : RoutePath.details(products.indexOf(_selectedBook));
  }

  @override
  Widget build(BuildContext context) {
    print("4===${pageID}");
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('BooksListPage'),
          child: HomeScreen(
            products: products,
            onTapped: _handleBookTapped,
            onAbout: (String value) {
              _handlePageTapped(value);
            },
          ),
        ),
        if (show404)
          MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
        else if (pageID == "about")
          MaterialPage(key: ValueKey('about'), child: AboutScreen())
        else if (pageID == "contact")
          MaterialPage(
              key: ValueKey('contact'),
              child: ContactScreen(
                onAbout: (String value) {
                  _handlePageTapped(value);
                },
              ))
        else if (pageID == "product")
          MaterialPage(key: ValueKey('product'), child: ProductScreen( onAbout: (String value) {
                  _handlePageTapped(value);
                },))
        else if (pageID == "login")
          MaterialPage(key: ValueKey('login'), child: LoginScreen( onAbout: (String value) {
                  _handlePageTapped(value);
                },))
        else if (pageID == "shopping")
          MaterialPage(key: ValueKey('shopping'), child: ShoppingScreen( onAbout: (String value) {
                  _handlePageTapped(value);
                },))
        else if (_selectedBook != null)
          DetailsPage(product: _selectedBook)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedBook = null;
        show404 = false;
        pageID = "";
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RoutePath path) async {
    if (path.isUnknown) {
      _selectedBook = null;
      show404 = true;
      return;
    }
    if (path.pageID == "about" ||
        path.pageID == "contact" ||
        path.pageID == "product" ||
        path.pageID == "login" ||
        path.pageID == "shopping") {
      _selectedBook = null;
      show404 = false;
      pageID = path.pageID;
      return;
    }

    if (path.isDetailsPage) {
      if (path.id < 0 || path.id > products.length - 1) {
        show404 = true;
        return;
      }

      _selectedBook = products[path.id];
    } else {
      _selectedBook = null;
    }

    show404 = false;
    pageID = "";
  }

  void _handleBookTapped(Product book) {
    _selectedBook = book;
    notifyListeners();
  }

  void _handlePageTapped(String id) {
    pageID = id;
    notifyListeners();
  }
}
