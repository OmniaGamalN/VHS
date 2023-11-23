import 'package:challene1/networking/network.dart';

String apiUrl = 'http://34.243.128.248:8080/VHS_API_CHAT_BOT/api/auth/signin';

class UserModel {
  Future<Map<String, dynamic>> postUserData(
      String userName, String passWord) async {
    try {
      NetworkHelper networkHelper = NetworkHelper(apiUrl, userName, passWord);
      var userData = await networkHelper.postData();
      return userData;
    } catch (e) {
      rethrow;
    }
  }
}
