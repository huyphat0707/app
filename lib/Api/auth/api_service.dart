import 'dart:async';
import 'package:app/Controller/login.dart';
import 'package:app/Model/auth/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  Future<LoginResponse> login(LoginRequestModel requestModel) async {
    String url = "https://database-app-11.herokuapp.com/v1/auth/login";
    Map<String, String> headers = {"Accept": "application/json"};
    var response = await http
        .post(Uri.parse(url), headers: headers, body: requestModel.toJson())
        .timeout(const Duration(seconds: 10), onTimeout: () {
      throw TimeoutException("connection time out try again");
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var token = json.decode(response.body)['data']['token'];
      _save(token);
      return LoginResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
_save(String token) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = token;
  prefs.setString(key, value);
}