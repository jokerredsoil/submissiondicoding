import 'dart:convert';
import 'api_client.dart';
import 'package:submissiondicoding/models/movie_model.dart';

class MovieService {
  final ApiClient apiClient;
  List<Movie>? _cachedMovies;

  MovieService({required this.apiClient});

  Future<List<Movie>> fetchPopularMovies({required String apikey}) async {
    if (_cachedMovies != null) {
      return _cachedMovies!;
    }

    final response = await apiClient.get('/movie/popular');

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['results'];
      _cachedMovies = jsonData.map((json) => Movie.fromJson(json)).toList();
      return _cachedMovies!;
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Invalid API key');
    } else if (response.statusCode == 404) {
      throw Exception('Not Found: The requested resource was not found');
    } else {
      throw Exception(
          'Failed to load popular movies. Status code: ${response.statusCode}');
    }
  }
}
