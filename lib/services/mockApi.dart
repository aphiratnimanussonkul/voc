import 'dart:convert';

import 'package:http/http.dart' as http;

class MockApi {
  Future<dynamic> getMockData() async {
    http.Response result =
        await http.get("https://covid19.th-stat.com/api/open/today");
    return jsonDecode(result.body.toString());
  }
}
