import 'package:flutter/material.dart';
import 'package:k_app/models/user_model.dart';
import 'package:k_app/screens/loginpage_screen.dart';
import 'package:k_app/widgets/bottomnavy.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 40,),
          const Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Color.fromARGB(255, 12, 58, 123),
              foregroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'user12341',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 58, 123),
                  fontSize: 23),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 70,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 12, 58, 123),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                  color: Colors.white,
                ),
                const Text(
                  'Setting',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            color: const Color.fromARGB(255, 12, 58, 123),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.storage),
                  color: Colors.white,
                ),
                const Text(
                  'Storage and Data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            color: const Color.fromARGB(255, 12, 58, 123),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.backup),
                  color: Colors.white,
                ),
                const Text(
                  'Backup',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            color: const Color.fromARGB(255, 12, 58, 123),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                  color: Colors.white,
                ),
                const Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            color: const Color.fromARGB(255, 12, 58, 123),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.privacy_tip),
                  color: Colors.white,
                ),
                const Text(
                  'Privacy',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            color: const Color.fromARGB(255, 12, 58, 123),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.language),
                  color: Colors.white,
                ),
                const Text(
                  'Language',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              await AuthManager.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPageScreen()),
              );
            },
            child: Container(
              width: double.infinity,
              height: 70,
              color: const Color.fromARGB(255, 12, 58, 123),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.logout),
                    color: Colors.white,
                  ),
                  const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
