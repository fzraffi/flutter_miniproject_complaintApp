import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:k_app/models/news_model.dart';
import 'package:k_app/providers/news_provider.dart';
import 'package:k_app/screens/newspage_screen.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';


// Mock NewsProvider
class MockNewsProvider extends Mock implements NewsProvider {}

void main() {
  testWidgets('UI Testing on NewsPage', (WidgetTester tester) async {
    // Setup the MockNewsProvider
    final mockNewsProvider = MockNewsProvider();
    when(mockNewsProvider.news).thenReturn([
      NewsModel(title: 'Test News 1', desc: 'Description 1', author: 'Author 1', id: 1),
      NewsModel(title: 'Test News 2', desc: 'Description 2', author: 'Author 2', id: 2),
    ]);

    // Build our app and trigger a frame
    await tester.pumpWidget(
      ChangeNotifierProvider<NewsProvider>(
        create: (_) => mockNewsProvider,
        child: const MaterialApp(
          home: NewsPage(),
        ),
      ),
    );

    // Verify AppBar title
    expect(find.text('News'), findsOneWidget);

    // Verify news items are displayed
    expect(find.text('Test News 1'), findsOneWidget);
    expect(find.text('Description 1'), findsOneWidget);
    expect(find.text('Author 1'), findsOneWidget);

    expect(find.text('Test News 2'), findsOneWidget);
    expect(find.text('Description 2'), findsOneWidget);
    expect(find.text('Author 2'), findsOneWidget);

    // Verify 'Read More' text
    expect(find.text('Read More'), findsNWidgets(2));

    // Verify FloatingActionButton
    expect(find.byType(FloatingActionButton), findsOneWidget);
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
  });
}
