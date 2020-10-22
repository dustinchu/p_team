import 'package:flutter/material.dart';
import 'package:p_team/common/responsive_widget.dart';
import 'package:p_team/common/widget/navigation_bottom_bar.dart';

class ContactScreen extends StatefulWidget {
  final ValueChanged<String> onAbout;
  ContactScreen({
    @required this.onAbout,
  });

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Text("Contact"),
            Container(
              color: Colors.blue,
              height: 500,
            ),
            Container(
              color: Colors.pink,
              height: 500,
            ),
            Container(
              color: Colors.orange,
              height: 500,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ResponsiveWidget.isSmallScreen(context)
          ? NavigationBottomBar(
              selectedIndex: 1,
              onSelectTab: (index) {
                switch (index) {
                  case 0:
                    widget.onAbout("/");
                    break;
                  case 1:
                    widget.onAbout("contact");
                    break;
                  case 2:
                    widget.onAbout("product");
                    break;
                  case 3:
                    widget.onAbout("shopping");
                    break;
                  case 4:
                    widget.onAbout("login");
                    break;
                  default:
                }
              },
            )
          : null,
    );
  }
}
