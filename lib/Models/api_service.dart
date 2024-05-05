import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://parkingsystem-hjcb.onrender.com';

  Future<dynamic> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result is Map && result.containsKey('data')) {
        return result['data'];  
      }
      return result; 
    } else {
      throw Exception('Failed to fetch data with status code: ${response.statusCode}');
    }
  }
}
