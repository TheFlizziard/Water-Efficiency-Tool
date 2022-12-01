import 'dart:convert';

import 'package:http/http.dart' as http;

// create a class 'CallApi' to make the API calls
class CallApi {
  final String _url = 'localhost:3000/api';
  final client = http.Client();

  getData(String endpoint) async {
    var response = await http.get(Uri.parse("http://172.16.75.170:3000/api/getall"));
    return jsonDecode(response.body);
  }
}
