import 'dart:convert';
import 'package:http/http.dart' as http;

String url =
    'http://34.243.128.248:8080/VHS_API_CHAT_BOT/api/employees/getEmployeeById';

class UserProfileModel {
  String jwtToken;
  int id;
  UserProfileModel(this.jwtToken, this.id);
  Future<Map<String, dynamic>> getUserData() async {
    Uri apiUrl = Uri.parse(url);
    Map<String, String> headers = {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json; charset=UTF-8'
    };
    final http.Response response = await http.post(
      apiUrl,
      headers: headers,
      body: jsonEncode(id),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      throw 'Problem with the post request';
    }
  }
}
