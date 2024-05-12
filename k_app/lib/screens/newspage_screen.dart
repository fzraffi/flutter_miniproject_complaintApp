import 'package:flutter/material.dart';
import 'package:k_app/providers/news_provider.dart';
import 'package:k_app/screens/inputissuepage_screen.dart';
import 'package:k_app/widgets/bottomnavy.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getNews();
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 58, 123),
        title: const Text(
          'News',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
                          color: const Color.fromARGB(255, 187, 210, 255),
        child: Consumer<NewsProvider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: newsProvider.news?.length ?? 0,
            itemBuilder: (context, index) {
              final news = newsProvider.news?[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(

                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news!.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(news.desc),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(news.author),
                            Text(
                              'Read More',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 30, 188, 217),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => IssuePageScreen()));
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
