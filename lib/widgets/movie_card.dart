import 'package:flutter/material.dart';
import 'package:submissiondicoding/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onDelete;

  const MovieCard({super.key, required this.movie, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
        title: Text(
          movie.title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${movie.releaseDate}\nRating: ${movie.voteAverage} (${movie.voteCount} votes)\n${movie.overview}',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
