// providers/movie_provider.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import '../services/api_client.dart';
import 'dart:convert';

class MovieProvider extends ChangeNotifier {
  final ApiClient apiClient;

  // List to store fetched movies
  List<dynamic> _movies = [];

  // Getter for movies
  List<dynamic> get movies => _movies;

  // Loading state
  bool _isLoading = false;

  // Getter for loading state
  bool get isLoading => _isLoading;

  MovieProvider({required this.apiClient});

  // Method to fetch popular movies
  Future<void> fetchPopularMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await apiClient.get('/movie/popular');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _movies = data['results']; // Assuming TMDB API returns movies in `results`
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (error) {
      log('Error fetching movies: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
