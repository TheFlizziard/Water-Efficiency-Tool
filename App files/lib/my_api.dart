import 'dart:convert';

import 'package:http/http.dart' as http;

// create a class 'CallApi' to make the API calls
class CallApi {
  final String _url = 'localhost:3000/api';
  final client = http.Client();

  getData(String endpoint) async {
    var response = await http.get(Uri.parse("http://10.0.2.2:3000/api/getall"));
    return jsonDecode(response.body);
  }
  getConsumption(String endpoint) async {
    var response = await http.get(Uri.parse("http://10.0.2.2:3000/api/getConsumption"));
    return jsonDecode(response.body);
  }
  getOne(String endpoint) async {
    var response = await http.get(Uri.parse("http://10.0.2.2:3000/api/getOne/$endpoint"));
    return jsonDecode(response.body);
  }
  getAppliancesName(String endpoint) async {
    var response = await http.get(Uri.parse("http://10.0.2.2:3000/api/getAppliances"));
    return jsonDecode(response.body);
  }
  getCurrentConsumption() async {
    var response = await http.get(Uri.parse("http://10.0.2.2:3000/api/getCurrentConsumption"));
    return jsonDecode(response.body);
  }
}
