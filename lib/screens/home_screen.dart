import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        centerTitle: true,
      ),
      body: movieProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : movieProvider.movies.isEmpty
              ? const Center(
                  child: Text(
                    'No movies available.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              : ListView.builder(
                  itemCount: movieProvider.movies.length,
                  itemBuilder: (context, index) {
                    final movie = movieProvider.movies[index];
                    return MovieCard(movie: movie);
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: movieProvider.fetchPopularMovies,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
