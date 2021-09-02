import 'dart:async';
import 'package:app/Api/baseApi.dart';
import 'package:app/Model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class APIUser {
  Future<List<User>?> getAllUser() async {
    try {
      var response = await http.get(Uri.parse('${API.baseUrl}/admin/allUser'))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try again");
      });
      if (response.statusCode == 200) {
        List jsonResponse = convert.jsonDecode(response.body)['user'];
        return jsonResponse.map((e) => new User.fromJson(e)).toList();
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }
}
