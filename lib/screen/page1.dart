import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voc/services/mockApi.dart';

class Page1Screen extends StatefulWidget {
  @override
  _Page1ScreenState createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen> {
  MockApi _mockApi = new MockApi();
  bool _isGetData = false;

  Future<dynamic> _getDataFromApi() async {
    return _mockApi.getMockData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page1 Screen"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            RaisedButton(
              child: Text("Get data from api"),
              onPressed: () {
                setState(() {
                  _isGetData = true;
                });
              },
              color: Colors.amber,
            ),
            _isGetData
                ? FutureBuilder(
                    future: _getDataFromApi(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "จำนวนผู้ติดเชื้อทั้งหมด : ${snapshot.data['Confirmed']} คน"),
                            Text(
                                "จำนวนผู้ป่วยที่รักษาหายแล้ว : ${snapshot.data['Recovered']} คน"),
                            Text(
                                "จำนวนผู้เสียชีวิต : ${snapshot.data['Deaths']} คน")
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
