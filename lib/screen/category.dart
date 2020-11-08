import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voc/routes.dart';

class VocabularyScreen extends StatefulWidget {
  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  final List<String> _vocap = [
    "TOEIC Set 1 (หมวดธุรกิจทั่วไป)",
    "TOEIC Set 2 (หมวด Office)",
    "TOEIC Set 3 (หมวดฝ่ายบุคคล)",
    "TOEIC Set 4 (หมวดการจัดซื้อสินค้า)",
    "TOEIC Set 5 (หมวดการเงิน)",
    "TOEIC Set 6 (หมวดการจัดการ)",
    "Sport",
    "Things in the bathroom",
    "Vehicles"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFf2f6f9),
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          "Vocabulary",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.rooted);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
       ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        print(i);
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index < _vocap.length) {
          return _buildRow(_vocap[index]);
        }
      }
    );
  }  

  Widget _buildRow(String word) {
    return ListTile(
      title: Text(
        word,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {},
    );
  }
}
