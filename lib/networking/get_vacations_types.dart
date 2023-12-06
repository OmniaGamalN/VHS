import 'package:http/http.dart' as http;
import 'dart:convert';

String url = 'http://34.243.128.248:8080/VHS_API_CHAT_BOT/api/getVacationTypes';

class VacationsTypesModel {
  String jwtToken;
  int id;
  VacationsTypesModel(this.jwtToken, this.id);

  Future<Map<String, dynamic>> postVacationsTypes() async {
    Uri apiUrl = Uri.parse(url);
    Map<String, String> headers = {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json; charset=UTF-8'
    };
    final http.Response response = await http.post(
      apiUrl,
      headers: headers,
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      throw 'Problem with the post request';
    }
  }
}
