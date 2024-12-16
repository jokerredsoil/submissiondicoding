// widgets/movie_card.dart

import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: movie.posterPath.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  width: 50,
                  height: 75,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 50,
                    );
                  },
                ),
              )
            : const Icon(
                Icons.movie,
                color: Colors.grey,
                size: 50,
              ),
        title: Text(
          movie.title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          movie.releaseDate.isNotEmpty
              ? 'Release Date: ${movie.releaseDate}'
              : 'Release Date: Unknown',
          style: const TextStyle(fontSize: 14.0),
        ),
        onTap: () {
          // Handle tap event, e.g., navigate to a detailed screen
        },
      ),
    );
  }
}
