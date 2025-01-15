import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submissiondicoding/providers/movie_provider.dart';
import 'package:submissiondicoding/screens/home_screen.dart';
import 'package:submissiondicoding/screens/favorite_movies_screen.dart';
import 'package:submissiondicoding/services/api_client.dart';
import 'package:submissiondicoding/services/movie_service.dart';

void main() {
  const String apiKey = '259c19bc707cc6e125e6f51b8973b23a';
  final apiClient = ApiClient(baseUrl: 'https://api.themoviedb.org/3', apiKey: apiKey);
  final movieService = MovieService(apiClient: apiClient);

  const String myAppName = 'Flutter Movie App';

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider(movieService)),
      ],
      child: MyApp(appName: myAppName),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String appName;

  const MyApp({super.key, required this.appName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/favorites': (context) => FavoriteMoviesScreen(),
      },
    );
  }
}
