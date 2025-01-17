import 'package:flutter/material.dart';
import 'package:submissiondicoding/models/movie_detail_model.dart';
import 'package:submissiondicoding/services/api_client.dart';
import 'package:submissiondicoding/services/movie_service.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({super.key, required this.movieId});
  final int movieId;
  final apiClient = ApiClient(
      baseUrl: 'https://api.themoviedb.org/3',
      apiKey: '259c19bc707cc6e125e6f51b8973b23a');

  @override
  Widget build(BuildContext context) {
    final movieService = MovieService(apiClient: apiClient);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: FutureBuilder<MovieDetail>(
        future: movieService.getMovieById(id: movieId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final movie = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (movie.backdrop_path != null)
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.backdrop_path}',
                    ),
                  const SizedBox(height: 16.0),
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Release Date: ${movie.release_date}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Runtime: ${movie.runtime} minutes',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Rating: ${movie.vote_average} (${movie.vote_count} votes)',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Overview',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    movie.overview,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Genres',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children: movie.genres
                        .map((genre) => Chip(label: Text(genre.name)))
                        .toList(),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Production Companies',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movie.production_companies
                        .map((company) => Text('- ${company.name}'))
                        .toList(),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Movie not found.'));
          }
        },
      ),
    );
  }
}
