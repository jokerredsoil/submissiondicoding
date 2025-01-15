import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submissiondicoding/providers/movie_provider.dart';
import 'package:submissiondicoding/widgets/movie_card.dart';
import 'package:submissiondicoding/screens/favorite_movies_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieProvider>(context, listen: false).fetchMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteMoviesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if (provider.movies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.movies.length,
              itemBuilder: (context, index) {
                final movie = provider.movies[index];
                return MovieCard(
                  movie: movie,
                  onDelete: () {
                    provider.removeMovie(movie);
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<MovieProvider>(context, listen: false).fetchMovies();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
