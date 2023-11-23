import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  String userName;
  String passWord;
  NetworkHelper(this.url, this.userName, this.passWord);
  Future<Map<String, dynamic>> postData() async {
    Uri apiUrl = Uri.parse(url);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    final http.Response response = await http.post(apiUrl,
        headers: headers,
        body: jsonEncode(
            <String, String>{'username': userName, 'password': passWord}));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      // String data = response.body;
      // return jsonDecode(data);
      throw 'Problem with the post request';
    }
  }
}
