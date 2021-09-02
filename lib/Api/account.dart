import 'dart:async';
import 'package:app/Api/baseApi.dart';
import 'package:app/Model/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class AccountApi {
  Future<User?> profile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value = prefs.get(key ) ?? 0;
      var header = {"Accept": "application/json", 'Authorization': 'Bearer $value'};
      var response = await http
          .get(Uri.parse('${API.baseUrl}/account/profile'), headers: header)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try again");
      });
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body)['data'];
        return jsonResponse;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }
}

