import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.90.19.222/myapi/"; // Ganti dengan IP laptop Anda

  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/index.php"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
