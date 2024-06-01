import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:k_app/providers/user_provider.dart';
import 'package:k_app/screens/loginpage_screen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('LoginPageScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: const MaterialApp(
          home: LoginPageScreen(),
        ),
      ),
    );

    expect(find.text('Login'), findsWidgets);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Forgot Password'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

  });
}
