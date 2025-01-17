import 'package:flutter/material.dart';
import 'package:submissiondicoding/models/movie_model.dart';
import 'package:submissiondicoding/services/movie_service.dart';

class MovieProvider with ChangeNotifier {
  final MovieService _movieService;
  List<Movie> _movies = [];
  final List<Movie> _favoriteMovies = [];

  MovieProvider(this._movieService);

  List<Movie> get movies => _movies;
  List<Movie> get favoriteMovies => _favoriteMovies;

 

  Future<void> fetchMovies() async {
    try {
      _movies = await _movieService.fetchMovies();
      print('Fetched movies: $_movies'); // Debug print
      notifyListeners();
    } catch (error) {
      print('Failed to fetch movies: $error'); // Debug print
    }
  }

  void addFavorite(Movie movie) {
    if (!_favoriteMovies.contains(movie)) {
      _favoriteMovies.add(movie);
      notifyListeners();
    }
  }

  void removeFavorite(Movie movie) {
    _favoriteMovies.remove(movie);
    notifyListeners();
  }

  void addMovie(Movie movie) {
    _movies.add(movie);
    notifyListeners();
  }

  void removeMovie(Movie movie) {
    _movies.remove(movie);
    notifyListeners();
  }

  void updateMovie(Movie movie, String newTitle) {
    final index = _movies.indexOf(movie);
    if (index != -1) {
      _movies[index] = Movie(
        id: movie.id,
        title: newTitle,
        overview: movie.overview,
        poster_path: movie.poster_path,
        release_date: movie.release_date,
        vote_average: movie.vote_average,
        vote_count: movie.vote_count,
      );
      notifyListeners();
    }
  }
}
