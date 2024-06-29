import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:k_app/models/user_model.dart';
import 'package:k_app/providers/location_provider.dart';
import 'package:k_app/providers/news_provider.dart';
import 'package:k_app/providers/reports_provider.dart';
import 'package:k_app/providers/user_provider.dart';
import 'package:k_app/screens/loginpage_screen.dart';
import 'package:k_app/screens/splash_screen.dart';
import 'package:k_app/services/gemini_api.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  Gemini.init(apiKey: GEMINI_API_KEY);
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(url: "https://kmcrslkjoptlavxsmeti.supabase.co", anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImttY3JzbGtqb3B0bGF2eHNtZXRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM3NzAxMzUsImV4cCI6MjAyOTM0NjEzNX0.GtaklIut7JNHxyIfe3yl7XpBNXEFZigpCneXkjJTSpk");

  WidgetsFlutterBinding.ensureInitialized();
  bool? loggedIn = await AuthManager.isLoggedIn();
  runApp(MyApp(loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool loggedIn;

  const MyApp({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => ReportsProvider())
        ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(loggedIn: loggedIn),
      ),
    );
  }
}

