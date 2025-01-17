import 'package:flutter/material.dart';
import 'package:submissiondicoding/models/movie_model.dart';
import 'package:submissiondicoding/screens/favorite_movies_screen.dart';
import 'package:submissiondicoding/screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
 

  const MovieCard(
      {super.key,
      required this.movie,
      required this.isFavorite,
      required this.onFavoriteToggle,
    });

  @override
  Widget build(BuildContext context) {
    final title = movie.title is String ? movie.title : 'Unknown';
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Image.network(
            'https://image.tmdb.org/t/p/w500${movie.poster_path}'),
        title: Text(
          title.toString(),
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${movie.release_date}\nRating: ${movie.vote_average} (${movie.vote_count} votes)\n${movie.overview}',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          children: [
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: !isFavorite ? null : Colors.red,
              ),
              onPressed: onFavoriteToggle,
            ),
            
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(movieId: movie.id)));
        },
      ),
    );
  }
}
