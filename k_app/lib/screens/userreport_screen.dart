import 'package:flutter/material.dart';

class UserReportScreen extends StatefulWidget {
  const UserReportScreen({super.key});

  @override
  State<UserReportScreen> createState() => _UserReportScreenState();
}

class _UserReportScreenState extends State<UserReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 58, 123),
        title: const Text(
          'My Report',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}