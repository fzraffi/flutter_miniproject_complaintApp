import 'package:flutter/material.dart';
import 'package:k_app/models/user_model.dart';
import 'package:k_app/providers/user_provider.dart';
import 'package:k_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool? loggedIn = await AuthManager.isLoggedIn();
  runApp(MyApp(loggedIn: loggedIn ?? false)); // Menggunakan nilai default jika null
}

class MyApp extends StatelessWidget {
  final bool loggedIn;

  const MyApp({Key? key, required this.loggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(loggedIn: loggedIn),
      ),
    );
  }
}

