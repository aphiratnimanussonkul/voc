import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voc/routes.dart';

class Page3Screen extends StatefulWidget {
  @override
  _Page3ScreenState createState() => _Page3ScreenState();
}

class _Page3ScreenState extends State<Page3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page3 Screen"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Card(
                    color: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Container(
                        padding: const EdgeInsets.all(0),
                        // alignment: Alignment.topRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                                "https://s3.amazonaws.com/uifaces/faces/twitter/mahmoudmetwally/128.jpg"),
                            Text("Text in a Card"),
                          ],
                        )),
                  ),
                ),
              ),
              Container(
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: InkWell(
                        splashColor: Colors.black,
                        onTap: () {
                          print("Card Clicked");
                          Get.back();
                        },
                        child: Card(
                          color: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 8,
                          child: Container(
                            child: Center(),
                          ),
                        ))),
              ),
              Container(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Container(
                      child: Center(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
