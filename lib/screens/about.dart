import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    double padValue = 0;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
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
    );
  }
}
