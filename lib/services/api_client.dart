import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final String apiKey;

  ApiClient({required this.baseUrl, required this.apiKey});

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint?api_key=$apiKey'));
    return _processResponse(response);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint?api_key=$apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }
}
