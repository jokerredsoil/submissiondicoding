// services/api_client.dart
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final String _baseUrl = 'https://api.themoviedb.org/3';

  String get _apiKey => dotenv.env['API_KEY'] ?? '';

  Future<http.Response> get(String endpoint) async {
    final url = '$_baseUrl$endpoint&api_key=$_apiKey';
    return await http.get(Uri.parse(url));
  }
}
