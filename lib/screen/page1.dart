import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page1Screen extends StatefulWidget {
  @override
  _Page1ScreenState createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page1 Screen"),
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
