// widgets/movie_card.dart

import 'package:flutter/material.dart';
import 'package:submissiondicoding/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: movie.posterPath.isNotEmpty
            ? Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}')
            : Icon(Icons.movie),
        title: Text(movie.title),
        subtitle: Text(movie.releaseDate),
      ),
    );
  }
}
