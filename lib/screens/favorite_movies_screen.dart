import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submissiondicoding/models/movie_model.dart';
import 'package:submissiondicoding/providers/movie_provider.dart';
import 'package:submissiondicoding/widgets/movie_card.dart';

class FavoriteMoviesScreen extends StatefulWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  State<FavoriteMoviesScreen> createState() => _FavoriteMoviesScreenState();
}

class _FavoriteMoviesScreenState extends State<FavoriteMoviesScreen> {
  bool _isLoading = false; // State variable to show loading indicator

  void _removeMovie(BuildContext context, Movie movie) async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Simulate a delay to show loading
    await Future.delayed(const Duration(seconds: 1));

    Provider.of<MovieProvider>(context, listen: false).removeFavorite(movie);

    setState(() {
      _isLoading = false; // Hide loading indicator
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : provider.favoriteMovies.isEmpty
              ? const Center(
                  child: Text(
                    'No favorite movies yet.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              : ListView.builder(
                  itemCount: provider.favoriteMovies.length,
                  itemBuilder: (context, index) {
                    final movie = provider.favoriteMovies[index];
                    return MovieCard(
                      movie: movie,
                      isFavScreen: true,
                      onDelete: () => _removeMovie(context, movie),
                    );
                  },
                ),
    );
  }
}
