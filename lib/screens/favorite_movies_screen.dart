import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submissiondicoding/providers/movie_provider.dart';
import 'package:submissiondicoding/widgets/movie_card.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if (provider.favoriteMovies.isEmpty) {
            return const Center(
              child: Text(
                'No favorite movies yet.',
                style: TextStyle(fontSize: 18.0),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.favoriteMovies.length,
              itemBuilder: (context, index) {
                final movie = provider.favoriteMovies[index];
                return MovieCard(
                  movie: movie,
                  onDelete: () {
                    provider.removeFavoriteMovie(movie);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
