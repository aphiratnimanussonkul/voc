import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voc/routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            RaisedButton(
              child: Text("Page 1"),
              onPressed: () {
                Get.toNamed(Routes.page1);
              },
              color: Colors.amber,
            ),
            RaisedButton(
              child: Text("Page 2"),
              onPressed: () {
                Get.toNamed(Routes.page2);
              },
              color: Colors.amber[100],
            ),
            RaisedButton(
              child: Text("Page 3"),
              onPressed: () {
                Get.toNamed(Routes.page3);
              },
              color: Colors.amber,
            ),
            RaisedButton(
              child: Text("Page 5 Flipcard"),
              onPressed: () {
                Get.toNamed(Routes.page5flipcard);
              },
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
