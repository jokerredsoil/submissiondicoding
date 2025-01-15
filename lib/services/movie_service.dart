import 'package:submissiondicoding/models/movie_model.dart';
import 'package:submissiondicoding/services/api_client.dart';

class MovieService {
  final ApiClient apiClient;

  MovieService({required this.apiClient});

  Future<List<Movie>> fetchMovies() async {
    final response = await apiClient.get('/discover/movie');
    return (response['results'] as List)
        .map((movie) => Movie.fromJson(movie))
        .toList();
  }

  Future<void> addMovie(Movie movie) async {
    await apiClient.post('/movie', movie.toJson());
  }
}
