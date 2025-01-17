import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submissiondicoding/models/movie_model.dart';
import 'package:submissiondicoding/providers/movie_provider.dart';

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
          final favoriteMovies = provider.favoriteMovies;

          if (favoriteMovies.isEmpty) {
            return const Center(
              child: Text(
                'No favorite movies yet!',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              final Movie movie = favoriteMovies[index];
              return ListTile(
                leading: movie.poster_path != null
                    ? Image.network(
                        movie.poster_path!,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.movie),
                title: Text(movie.title ?? 'unknown title'),
                subtitle: Text(movie.overview ?? 'No overview available'),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    provider.removeFavoriteMovie(movie);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
