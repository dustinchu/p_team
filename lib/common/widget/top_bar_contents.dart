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
        color: Color.fromRGBO(41, 41, 48, 1),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              InkWell(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 72,
                  height: 72,
                ),
                onTap: () => print("logo click"),
              ),

              // Text(
              //   'P.team',
              //   style: TextStyle(
              //     color: Colors.blueGrey[100],
              //     fontSize: 20,
              //     fontFamily: 'Montserrat',
              //     fontWeight: FontWeight.w400,
              //     letterSpacing: 3,
              //   ),
              // ),
              SizedBox(width: screenSize.width / 20),
              TopBarInkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[0] = true : _isHovering[0] = false;
                  });
                },
                ontap: () {},
                text: "關於品大",
                isHovering: _isHovering[0],
              ),
              SizedBox(width: screenSize.width / 30),
              TopBarInkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[1] = true : _isHovering[0] = false;
                  });
                },
                ontap: () {},
                text: "產品分類",
                isHovering: _isHovering[1],
              ),
              SizedBox(width: screenSize.width / 30),
              TopBarInkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[2] = true : _isHovering[2] = false;
                  });
                },
                ontap: () {},
                text: "聯絡我們",
                isHovering: _isHovering[2],
              ),
              Expanded(
                child: Text(""),
              ),

              SizedBox(
                width: screenSize.width / 5,
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white70,
                    ),
                    hintText: "搜尋產品",
                    hintStyle: TextStyle(fontSize: 15),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                  ),
                  onEditingComplete: () => print("enter回調"),
                ),
              ),
              SizedBox(width: screenSize.width / 30),

              Badge(
                position: BadgePosition.topEnd(top: -5, end: -5),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  "3",
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    icon: Icon(Icons.shopping_cart_outlined), onPressed: () {}),
              ),
              SizedBox(width: screenSize.width / 30),
              TopBarInkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[5] = true : _isHovering[5] = false;
                  });
                },
                ontap: () {},
                text: "登入",
                isHovering: _isHovering[5],
              ),
              SizedBox(width: screenSize.width / 20),
              TopBarInkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[6] = true : _isHovering[6] = false;
                  });
                },
                ontap: () {},
                text: "註冊",
                isHovering: _isHovering[6],
              ),
               SizedBox(width: screenSize.width / 20),
              // Expanded(
              //   child: Row(
              //     // mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       SizedBox(width: screenSize.width / 8),
              //       TopBarInkWell(
              //         onHover: (value) {
              //           setState(() {
              //             value
              //                 ? _isHovering[0] = true
              //                 : _isHovering[0] = false;
              //           });
              //         },
              //         ontap: () {},
              //         text: "品牌分類",
              //         isHovering: _isHovering[0],
              //       ),
              //       SizedBox(width: screenSize.width / 20),
              //       TopBarInkWell(
              //         onHover: (value) {
              //           setState(() {
              //             value
              //                 ? _isHovering[1] = true
              //                 : _isHovering[1] = false;
              //           });
              //         },
              //         ontap: () {},
              //         text: "查詢訂單",
              //         isHovering: _isHovering[1],
              //       ),
              //       SizedBox(width: screenSize.width / 20),
              //       TopBarInkWell(
              //         onHover: (value) {
              //           setState(() {
              //             value
              //                 ? _isHovering[2] = true
              //                 : _isHovering[2] = false;
              //           });
              //         },
              //         ontap: () {},
              //         text: "關於品大",
              //         isHovering: _isHovering[2],
              //       ),
              //       SizedBox(width: screenSize.width / 20),
              //       TopBarInkWell(
              //         onHover: (value) {
              //           setState(() {
              //             value
              //                 ? _isHovering[3] = true
              //                 : _isHovering[3] = false;
              //           });
              //         },
              //         ontap: () {},
              //         text: "聯絡我們",
              //         isHovering: _isHovering[3],
              //       ),
              //       SizedBox(width: screenSize.width / 20),
              //       TopBarInkWell(
              //         onHover: (value) {
              //           setState(() {
              //             value
              //                 ? _isHovering[4] = true
              //                 : _isHovering[4] = false;
              //           });
              //         },
              //         ontap: () {},
              //         text: "會員登入",
              //         isHovering: _isHovering[4],
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   width: screenSize.width / 50,
              // ),
              // Expanded(
              //   flex: 1,
              //   child: Row(
              //     children: [
              //       TopBarInkWell(
              //         onHover: (value) {
              //           setState(() {
              //             value
              //                 ? _isHovering[3] = true
              //                 : _isHovering[3] = false;
              //           });
              //         },
              //         ontap: () {},
              //         text: "聯絡我們",
              //         isHovering: _isHovering[3],
              //       ),
              //       SizedBox(width: screenSize.width / 20),
              //       TopBarInkWell(
              //         onHover: (value) {
              //           setState(() {
              //             value
              //                 ? _isHovering[4] = true
              //                 : _isHovering[4] = false;
              //           });
              //         },
              //         ontap: () {},
              //         text: "會員登入",
              //         isHovering: _isHovering[4],
              //       ),
              //       SizedBox(width: screenSize.width / 20),
              //       Badge(
              //         position: BadgePosition.topEnd(top: -5, end: -5),
              //         animationDuration: Duration(milliseconds: 300),
              //         animationType: BadgeAnimationType.slide,
              //         badgeContent: Text(
              //           "3",
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         child: IconButton(
              //             icon: Icon(Icons.shopping_cart), onPressed: () {}),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
