import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:k_app/models/user_model.dart';
import 'package:k_app/providers/location_provider.dart';
import 'package:k_app/providers/news_provider.dart';
import 'package:k_app/providers/user_provider.dart';
import 'package:k_app/screens/splash_screen.dart';
import 'package:k_app/services/gemini_api.dart';
import 'package:provider/provider.dart';

void main() async {
  Gemini.init(apiKey: GEMINI_API_KEY);
  WidgetsFlutterBinding.ensureInitialized();
  bool? loggedIn = await AuthManager.isLoggedIn();
  runApp(MyApp(loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool loggedIn;

  const MyApp({Key? key, required this.loggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider())
        ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(loggedIn: loggedIn),
      ),
    );
  }
}

