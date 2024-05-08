import 'package:flutter/material.dart';
import 'package:k_app/models/user_model.dart';
import 'package:k_app/screens/loginpage_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await AuthManager.logout();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPageScreen()),
            );
          },
          child: Text('Logout'),
        ),
    
      ),
    );
  }
}