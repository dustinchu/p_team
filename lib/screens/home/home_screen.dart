import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:p_team/common/responsive_widget.dart';
import 'package:p_team/common/web_scrollbar.dart';
import 'package:p_team/common/widget/navigation_bottom_bar.dart';
import 'package:p_team/model/product.dart';
import 'package:p_team/common/widget/top_bar_contents.dart';

import 'bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  final List<Product> products;
  final ValueChanged<Product> onTapped;
  final ValueChanged<String> onAbout;

  HomeScreen({
    @required this.products,
    @required this.onTapped,
    @required this.onAbout,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    double _fonsize1 = 64;
    int selectedIndex = 0;

    ResponsiveWidget.isSmallScreen(context) ? _fonsize1 = 40 : _fonsize1 = 64;
    final Stream<QuerySnapshot> _channelsStream = Firestore.instance
        .collection("product")
        .document("item")
        .collection("Connectors")
        .snapshots();

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Badge(
                    position: BadgePosition.topEnd(top: -5, end: -5),
                    animationDuration: Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      "3",
                      style: TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        icon: Icon(Icons.shopping_cart_outlined,
                            color: Colors.orange),
                        onPressed: () {}),
                  ),
                ),
              ],
              title: Text(
                'P.team',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            // FlatButton(
            //   child: Text("關於"),
            //   onPressed: () => widget.onAbout("about"),
            // ),
            SizedBox(
              height: 700,
              width: screenSize.width,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(48, 48, 48, 1),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        '我們是全球工程師及採購的最佳幫手',
                        style: TextStyle(fontSize: _fonsize1),
                        minFontSize: 10,
                        stepGranularity: 10,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("品大科技專注於電子元件的現貨供應，免運費、短交期。",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 50,
                      ),
                      FlatButton(
                        color: Colors.orange,
                        minWidth: 240,
                        height: 64,
                        onPressed: () => print("button"),
                        child: Text(
                          "立即購買",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Carousel(
              //   images: [
              //     // NetworkImage(
              //     //     'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
              //     // NetworkImage(
              //     //     'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
              //     ExactAssetImage("assets/images/1.jpg"),
              //     ExactAssetImage("assets/images/2.jpg"),
              //     ExactAssetImage("assets/images/3.jpg")
              //   ],
              //   dotSize: 4.0,
              //   dotSpacing: 15.0,
              //   dotColor: Colors.orange,
              //   indicatorBgPadding: 5.0,
              //   dotBgColor: Colors.purple.withOpacity(0.9),
              //   borderRadius: true,
              // )
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 36, bottom: 36),
              child: Row(
                children: [
                  Container(
                    width: (screenSize.width - 60) * 0.5,
                    height: 528,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 50),
                  Container(
                    width: (screenSize.width - 60) * 0.4,
                    height: 528,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "關於品大",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          AutoSizeText(
                            '我們是全球工程師及採購的最佳幫手',
                            style: TextStyle(fontSize: 24),
                            minFontSize: 10,
                            stepGranularity: 10,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          AutoSizeText(
                            '品大科技專注於電子元件的現貨供應，免運費、短交期。提供主動IC及被動元件、電阻、電容、連接器、繼電器自動化及控制元件等等。',
                            style: TextStyle(fontSize: 20),
                            minFontSize: 10,
                            stepGranularity: 10,
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () => print("BUTTON"),
                            child: Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(
                                    color: Colors.orange, width: 1.5), // 边色与边宽度
                                // color: Color(0xFF9E9E9E), // 底色
                                borderRadius:
                                    new BorderRadius.circular((5.0)), // 圆角度
                              ),
                              height: 60,
                              width: 200,
                              child: Center(
                                child: Text(
                                  "聯絡我們",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          // Text("提供主動IC及被動元件、電阻、電容、連接器、繼電器自動化及控制元件等等。"),
                          // Text("廣泛用於車用、家電、醫療、航太、工業控制、消費性產品、IPC設備。"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height / 30),
            // SizedBox(
            //   height: screenSize.height * 0.5,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20, right: 20),
            //     child: Card(
            //         child: StreamBuilder(
            //       stream: _channelsStream,
            //       builder: (BuildContext context,
            //           AsyncSnapshot<QuerySnapshot> snapshot) {
            //         if (snapshot.hasError) {
            //           return Text("Error${snapshot.error}");
            //         }
            //         switch (snapshot.connectionState) {
            //           case ConnectionState.waiting:
            //             return Center(
            //               child: CircularProgressIndicator(),
            //             );
            //           default:
            //             List<DocumentSnapshot> documents =
            //                 snapshot.data.documents;
            //             return snapshot.hasData != null
            //                 ? ListView(
            //                     key: GlobalKey(),
            //                     children:
            //                         documents.map((DocumentSnapshot document) {
            //                       return ListTile(
            //                         title: Text(document["DigiKeyPartNumber"]),
            //                       );
            //                     }).toList())
            //                 : Text("Nipe");
            //         }
            //       },
            //     )),
            //   ),
            // ),

            // SizedBox(
            //   height: screenSize.height * 0.5,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20, right: 20),
            //     child: ListView(
            //       children: [
            //         for (var product in widget.products)
            //           ListTile(
            //             title: Text(product.title),
            //             subtitle: Text(product.author),
            //             onTap: () => widget.onTapped(product),
            //           )
            //       ],
            //     ),
            //   ),
            // ),
            BottomBar(),
            // SizedBox(height: screenSize.height / 8),
          ],
          // SizedBox(height: screenSize.height / 8),
        ),
      ),
      bottomNavigationBar: ResponsiveWidget.isSmallScreen(context)
          ? NavigationBottomBar(
              selectedIndex: 0,
              onSelectTab: (index) {
                switch (index) {
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
      // body: Column(
      //   children: [
      //     FlatButton(
      //       child: Text("關於"),
      //       onPressed: () => widget.onAbout("about"),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: ListView(
      //         children: [
      //           for (var product in widget.products)
      //             ListTile(
      //               title: Text(product.title),
      //               subtitle: Text(product.author),
      //               onTap: () => widget.onTapped(product),
      //             )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
