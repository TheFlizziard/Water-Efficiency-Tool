import 'package:http/http.dart' as http;

// create a class 'CallApi' to make the API calls
class CallApi {
  final String _url = 'localhost:3000/api';
  final client = http.Client();

  // create a method to get the data from the API
  getData(String endpoint) async {
    var fullUrl = _url + endpoint;
    var uri = Uri.parse(fullUrl);
    return await http.get(uri);
  }
}
