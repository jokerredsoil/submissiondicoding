// services/api_client.dart
import 'package:http/http.dart' as http;
import 'package:submissiondicoding/constants/constants.dart';

class ApiClient {
  Future<http.Response> get(String endpoint) async {
    final url = '$baseUrl$endpoint&api_key=$apiKey';
    return await http.get(Uri.parse(url));
  }
}
