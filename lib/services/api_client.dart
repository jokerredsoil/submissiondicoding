// services/api_client.dart

import 'package:http/http.dart' as http;

class ApiClient {
  final String _baseUrl;
  final String _apiKey;

  ApiClient(this._baseUrl, this._apiKey);

  Future<http.Response> get(String endpoint) async {
    final url = '$_baseUrl$endpoint&api_key=$_apiKey';
    return await http.get(Uri.parse(url));
  }
}
