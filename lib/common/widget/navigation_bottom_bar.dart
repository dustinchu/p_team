import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavigationBottomBar extends StatelessWidget {
  int selectedIndex;
  Function onSelectTab;
  NavigationBottomBar({
    @required this.selectedIndex,
    @required this.onSelectTab,
  });

  @override
  Widget build(BuildContext context) {
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Color.fromRGBO(41, 41, 48, 1),
        selectedItemBorderColor: Color.fromRGBO(41, 41, 48, 0),
        selectedItemBackgroundColor: Colors.orange,
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Colors.white54,
      ),
      selectedIndex: selectedIndex,
      onSelectTab: onSelectTab,
      items: [
        FFNavigationBarItem(
          iconData: Icons.home_outlined,
          label: '首頁',
        ),
          FFNavigationBarItem(
          iconData: Icons.email_outlined,
          label: '聯絡我們',
        ),
        FFNavigationBarItem(
          iconData: Icons.menu_open_outlined,
          label: '產品分類',
        ),
      
        FFNavigationBarItem(
          iconData: Icons.shopping_cart_outlined,
          label: '購物車',
        ),
        FFNavigationBarItem(
          iconData: Icons.login_outlined,
          label: '登入',
        ),
      ],
    );
  }
}
