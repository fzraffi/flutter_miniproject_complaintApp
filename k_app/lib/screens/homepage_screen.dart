import 'package:flutter/material.dart';
import 'package:k_app/screens/geminichat.dart';
import 'package:k_app/screens/test.dart';
import 'package:k_app/widgets/bottomnavy.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image(image: AssetImage('assets/images/logo.png')),
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 12, 58, 123),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Find the issue',
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 12, 58, 123),
                            radius: 25,
                            child: Image(
                              image: AssetImage('assets/images/cityreport.png'),
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Text(
                            'Citizen\nReport',
                            style: TextStyle(
                                color: Color.fromARGB(255, 12, 58, 123),
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 12, 58, 123),
                              radius: 25,
                              child: Image(
                                  image: AssetImage('assets/images/news.png'),
                                  width: 30,
                                  height: 30)),
                          Text(
                            'News',
                            style: TextStyle(
                                color: Color.fromARGB(255, 12, 58, 123)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 12, 58, 123),
                              radius: 25,
                              child: Image(
                                  image: AssetImage('assets/images/cs.png'),
                                  width: 30,
                                  height: 30)),
                          Text(
                            'CS',
                            style: TextStyle(
                                color: Color.fromARGB(255, 12, 58, 123)),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector( onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ChatBotGeminiPage()));
                    },
                      child: const SizedBox(
                        height: 100,
                        child: Column(
                          children: [
                            CircleAvatar(
                                backgroundColor: Color.fromARGB(255, 12, 58, 123),
                                radius: 25,
                                child: Image(
                                    image: AssetImage('assets/images/ai.png'),
                                    width: 30,
                                    height: 30)),
                            Text(
                              'AI',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 12, 58, 123)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // SECOND MENU

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 12, 58, 123),
                              radius: 25,
                              child: Image(
                                image: AssetImage('assets/images/wifi.png'),
                                width: 30,
                                height: 30,
                              )),
                          Text(
                            'Nearby \n   Wifi',
                            style: TextStyle(
                                color: Color.fromARGB(255, 12, 58, 123)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 12, 58, 123),
                              radius: 25,
                              child: Image(
                                image: AssetImage('assets/images/cloud.png'),
                                width: 35,
                                height: 40,
                              )),
                          Text(
                            'Weather',
                            style: TextStyle(
                                color: Color.fromARGB(255, 12, 58, 123)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 12, 58, 123),
                              radius: 25,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/transportation.png'),
                                width: 30,
                                height: 45,
                              )),
                          Text(
                            'Travel',
                            style: TextStyle(
                                color: Color.fromARGB(255, 12, 58, 123)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 12, 58, 123),
                              radius: 25,
                              child: Image(
                                  image: AssetImage('assets/images/more.png'))),
                          Text(
                            'More',
                            style: TextStyle(
                                color: Color.fromARGB(255, 12, 58, 123)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 150,
                  color: const Color.fromARGB(255, 187, 210, 255),
                ),
              ],
            ),
          ],
        ),
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 30, 188, 217),
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.camera,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
