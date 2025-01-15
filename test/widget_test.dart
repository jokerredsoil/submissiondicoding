import 'package:flutter/material.dart' show Icons;
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:submissiondicoding/providers/movie_provider.dart';
import 'package:submissiondicoding/services/api_client.dart';
import 'package:submissiondicoding/services/movie_service.dart';
import 'package:submissiondicoding/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    const String apiKey = 'YOUR_TMDB_API_KEY';
    final apiClient = ApiClient(baseUrl: 'https://api.themoviedb.org/3', apiKey: apiKey);
    final movieService = MovieService(apiClient: apiClient);

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MovieProvider(movieService)),
        ],
        child: MyApp(appName: 'Flutter Movie App'),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
