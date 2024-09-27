import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://example.com/api'; // Replace with your API URL

  static Future<Map<String, dynamic>> signIn(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> signUp(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return jsonDecode(response.body);
  }

  // static Future<Map<String, dynamic>> fetchStudents() async {
  //   final response = await http.get(Uri.parse('$baseUrl/students'));
  //   return jsonDecode(response.body);
  // }

  // static Future<Map<String, dynamic>> getDueAmount(String studentId) async {
  //   final response = await http.get(Uri.parse('$baseUrl/dueAmount?studentId=$studentId'));
  //   return jsonDecode(response.body);
  // }
}
