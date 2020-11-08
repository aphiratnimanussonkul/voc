import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voc/routes.dart';
import 'package:flip_card/flip_card.dart';

class Page5Screen extends StatefulWidget {
  @override
  _Page5ScreenState createState() => _Page5ScreenState();
}

class _Page5ScreenState extends State<Page5Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page5 Screen"),
      ),
      body: Container(
          // padding: EdgeInsets.all(100),
          color: Colors.greenAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlipCard(
                  direction: FlipDirection.HORIZONTAL, // default
                  front: Center(
                    child: Container(
                      padding: EdgeInsets.all(60),
                      color: Colors.redAccent,
                      child: Text('Handsome'),
                    ),
                  ),
                  back: Center(
                    child: Container(
                      padding: EdgeInsets.all(60),
                      color: Colors.pink,
                      child: Text('หล่อ'),
                    ),
                  )),
            ],
          )),
    );
  }
}
