import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<String>login(String email, String password) async {
    final url = Uri.parse('https://app.happystories.io/api/V1/login');
    print(email);
    print(password);
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
        "device_token":"dhsbchsbhsadsaded",
        "device_type":"android",
        "device_id":"12345"
      },
    );

    final data = json.decode(response.body);


    if (response.statusCode == 200 && data['status'] == 200) {
      return response.body.toString();
    } else {
      throw Exception(data['message'] ?? 'Login failed');
    }
  }
}
