import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:p_team/common/responsive_widget.dart';
import 'package:p_team/model/product.dart';
import 'package:p_team/screens/home/top_bar_contents.dart';

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

    final Stream<QuerySnapshot> _channelsStream =
        Firestore.instance.collection("product").document("item").collection("Connectors").snapshots();

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                    icon: Icon(Icons.brightness_6),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => null),
              ],
              title: Text(
                'EXPLORE',
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
            SizedBox(height: screenSize.height / 20),
            SizedBox(
                height: screenSize.height * 0.5,
                width: screenSize.width,
                child: Carousel(
                  images: [
                    // NetworkImage(
                    //     'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                    // NetworkImage(
                    //     'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                    ExactAssetImage("assets/images/1.jpg"),
                    ExactAssetImage("assets/images/2.jpg"),
                    ExactAssetImage("assets/images/3.jpg")
                  ],
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.orange,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.purple.withOpacity(0.9),
                  borderRadius: true,
                )),
            SizedBox(height: screenSize.height / 30),
            SizedBox(
              height: screenSize.height * 0.5,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                    child: StreamBuilder(
                  stream: _channelsStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error${snapshot.error}");
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        List<DocumentSnapshot> documents =
                            snapshot.data.documents;
                        return snapshot.hasData != null
                            ? ListView(
                                key: GlobalKey(),
                                children:
                                    documents.map((DocumentSnapshot document) {
                                  return ListTile(
                                    title: Text(document["DigiKeyPartNumber"]),
                                  );
                                }).toList())
                            : Text("Nipe");
                    }
                  },
                )),
              ),
            ),

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
