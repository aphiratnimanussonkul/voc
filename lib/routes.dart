import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:voc/screen/home.dart';
import 'package:voc/screen/page1.dart';
import 'package:voc/screen/page2.dart';

class Routes {
  static const rooted = "/";
  static const page1 = "/page1";
  static const page2 = "/page2";

  static final pages = [
    _page(rooted, HomeScreen()),
    _page(page1, Page1Screen()),
    _page(page2, Page2Screen()),
  ];

  static GetPage _page(String path, Widget item) => GetPage(
      name: path,
      page: () => item,
      transitionDuration: Duration(milliseconds: 200));
}
