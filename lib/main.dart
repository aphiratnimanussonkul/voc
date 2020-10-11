import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:voc/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  _getPathRoute() async {
    return Routes.rooted;
  }

  GetMaterialApp _buildGetMaterialApp(String rootPath) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        getPages: Routes.pages,
        initialRoute: rootPath,
        transitionDuration: Duration(milliseconds: 200),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: Scaffold(
              body: child,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getPathRoute(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return _buildGetMaterialApp(snapshot.data);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
