import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/api_client.dart';
import 'services/movie_service.dart';
import 'providers/movie_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiClient>(create: (_) => ApiClient('https://api.themoviedb.org/3', 'your_api_key')),
        ProxyProvider<ApiClient, MovieService>(
          update: (context, apiClient, previous) => MovieService(apiClient),
        ),
        ChangeNotifierProvider(create: (context) => MovieProvider(MovieService(ApiClient('https://api.themoviedb.org/3', 'your_api_key')))),
      ],
      child: MaterialApp(
        title: 'Flutter TMDB App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
