import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:p_team/common/topBarInkWell.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        // color: Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
        color: Colors.orange,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'P.team',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    TopBarInkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      ontap: () {},
                      text: "品牌分類",
                      isHovering: _isHovering[0],
                    ),
                    SizedBox(width: screenSize.width / 20),
                    TopBarInkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      ontap: () {},
                      text: "查詢訂單",
                      isHovering: _isHovering[1],
                    ),
                    SizedBox(width: screenSize.width / 20),
                    TopBarInkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[2] = true
                              : _isHovering[2] = false;
                        });
                      },
                      ontap: () {},
                      text: "關於品大",
                      isHovering: _isHovering[2],
                    ),
                    SizedBox(width: screenSize.width / 20),
                    TopBarInkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[3] = true
                              : _isHovering[3] = false;
                        });
                      },
                      ontap: () {},
                      text: "聯絡我們",
                      isHovering: _isHovering[3],
                    ),
                    SizedBox(width: screenSize.width / 20),
                    TopBarInkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[4] = true
                              : _isHovering[4] = false;
                        });
                      },
                      ontap: () {},
                      text: "會員登入",
                      isHovering: _isHovering[4],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width / 50,
              ),
              Badge(
                position: BadgePosition.topEnd(top: -5, end: -5),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  "3",
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    icon: Icon(Icons.shopping_cart), onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
