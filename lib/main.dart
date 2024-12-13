import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

Future<void> main() async {
  try {
    await dotenv.load();
    // Print loaded API key to debug
    if (kDebugMode) {
      print('API_KEY from .env: ${dotenv.env['API_KEY']}');
    }
    runApp(MyApp());
  } catch (e) {
    if (kDebugMode) {
      print('Error loading .env file: $e');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TMDB App')),
        body: Center(child: Text('Flutter DotEnv Example')),
      ),
    );
  }
}
