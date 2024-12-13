// services/movie_service.dart

import 'dart:convert';
import 'api_client.dart';
import 'package:submissiondicoding/models/movie_model.dart';

class MovieService {
  final ApiClient apiClient;

  MovieService(this.apiClient);

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await apiClient.get('/movie/popular');

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['results'];
      return jsonData.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
