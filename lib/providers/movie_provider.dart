// providers/movie_provider.dart

import 'package:flutter/material.dart';
import '../../services/movie_service.dart';
import '../../models/movie_model.dart';

class MovieProvider with ChangeNotifier {
  final MovieService movieService;

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  MovieProvider(this.movieService);

  Future<void> loadMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      _movies = await movieService.fetchPopularMovies();
    } catch (error) {
      print('Error loading movies: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
