import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:voc/screen/home.dart';
import 'package:voc/screen/page1.dart';
import 'package:voc/screen/page2.dart';
import 'package:voc/screen/page3.dart';
import 'package:voc/screen/page5-flipcard.dart';

class Routes {
  static const rooted = "/";
  static const page1 = "/page1";
  static const page2 = "/page2";
  static const page3 = "/page3";
  static const page5flipcard = "/page5flipcard";

  static final pages = [
    _page(rooted, HomeScreen()),
    _page(page1, Page1Screen()),
    _page(page2, Page2Screen()),
    _page(page3, Page3Screen()),
    _page(page5flipcard, Page5Screen()),
  ];

  static GetPage _page(String path, Widget item) => GetPage(
      name: path,
      page: () => item,
      transitionDuration: Duration(milliseconds: 200));
}
