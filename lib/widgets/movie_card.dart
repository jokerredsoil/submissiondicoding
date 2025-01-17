import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submissiondicoding/models/movie_model.dart';
import 'package:submissiondicoding/providers/movie_provider.dart';
import 'package:submissiondicoding/screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onDelete;
  final bool isFavScreen;

  const MovieCard(
      {super.key,
      required this.movie,
      required this.onDelete,
      this.isFavScreen = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          final isFavorite = provider.favoriteMovies.contains(movie);
          final title = movie.title;

          return ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            leading: movie.poster_path != null
                ? Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                    width: 50,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.image, size: 50), // Placeholder icon
            title: Text(
              title,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${movie.release_date}\nRating: ${movie.vote_average} (${movie.vote_count} votes)\n${movie.overview}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: Icon(
                isFavScreen
                    ? Icons.delete
                    : isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                color: isFavScreen
                    ? const Color.fromARGB(
                        255, 5, 3, 3) 
                    : isFavorite
                        ? Colors.red
                        : null,
              ),
              onPressed: () {
                if (isFavorite) {
                  provider.removeFavorite(movie);
                } else {
                  provider.addFavorite(movie);
                }
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(movieId: movie.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
