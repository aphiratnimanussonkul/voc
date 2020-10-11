import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2Screen extends StatefulWidget {
  @override
  _Page2ScreenState createState() => _Page2ScreenState();
}

class _Page2ScreenState extends State<Page2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2 Screen"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            RaisedButton(
              child: Text("Get back to Home Page"),
              onPressed: () {
                Get.back();
              },
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
