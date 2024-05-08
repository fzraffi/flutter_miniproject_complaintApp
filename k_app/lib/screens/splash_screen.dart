import 'package:flutter/material.dart';
import 'package:k_app/screens/homepage_screen.dart';
import 'package:k_app/screens/loginpage_screen.dart';
import 'dart:async';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  final bool loggedIn;

  const SplashScreen({super.key, required this.loggedIn});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => widget.loggedIn ? const HomePageScreen() : const LoginPageScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tampilkan widget splash screen di sini
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
            width: 150,
            child: Image(image: AssetImage('assets/images/logo.png'))),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: LoadingAnimationWidget.prograssiveDots( // Perbaikan penulisan prograssiveDots
              color: const Color.fromARGB(255, 12, 58, 123),
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
