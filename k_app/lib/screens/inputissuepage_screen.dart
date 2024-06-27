import 'package:flutter/material.dart';
import 'package:k_app/providers/location_provider.dart';
import 'package:k_app/providers/reports_provider.dart';
import 'package:k_app/screens/userreport_screen.dart';
import 'package:provider/provider.dart';

class IssuePageScreen extends StatefulWidget {
  const IssuePageScreen({super.key});

  @override
  _IssuePageScreenState createState() => _IssuePageScreenState();
}

class _IssuePageScreenState extends State<IssuePageScreen> {
  TextEditingController descController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 58, 123),
        title: const Text(
          'Add Issue',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            const Text(
              'Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 12, 58, 123),
              ),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 187, 210, 255),
                border: OutlineInputBorder(
                  // Border
                  borderSide: BorderSide.none, // Hilangkan garis tepi
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  'Report Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 12, 58, 123),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<LocationProvider>(context, listen: false)
                        .getCurrentLocation();
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Generate Location',
                        style: TextStyle(color: Colors.green),
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.green,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 150,
              color: const Color.fromARGB(255, 187, 210, 255),
              child: Consumer<LocationProvider>(
                builder: (context, locationProvider, _) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Your current location:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                              onPressed: () {
                                Provider.of<LocationProvider>(context,
                                        listen: false)
                                    .clear();
                              },
                              icon: const Icon(Icons.remove_circle_outline),
                              color: Colors.red)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(locationProvider.address),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Report Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 12, 58, 123),
              ),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 187, 210, 255),
                border: OutlineInputBorder(
                  // Border
                  borderSide: BorderSide.none, // Hilangkan garis tepi
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 12, 58, 123),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Public Service';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(30, 30),
                      backgroundColor: selectedCategory == 'Public Service'
                          ? Colors.green
                          : const Color.fromARGB(255, 12, 58, 123)),
                  child: const Text(
                    'Public Service',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Inftastruktur';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(30, 30),
                      backgroundColor: selectedCategory == 'Inftastruktur'
                          ? Colors.green
                          : const Color.fromARGB(255, 12, 58, 123)),
                  child: const Text(
                    'Inftastruktur',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Criminality';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(30, 30),
                      backgroundColor: selectedCategory == 'Criminality'
                          ? Colors.green
                          : const Color.fromARGB(255, 12, 58, 123)),
                  child: const Text(
                    'Criminality',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Bully';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(30, 30),
                      backgroundColor: selectedCategory == 'Bully'
                          ? Colors.green
                          : const Color.fromARGB(255, 12, 58, 123)),
                  child: const Text(
                    'Bully',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Vehicle Emission';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(30, 30),
                      backgroundColor: selectedCategory == 'Vehicle Emission'
                          ? Colors.green
                          : const Color.fromARGB(255, 12, 58, 123)),
                  child: const Text(
                    'Vehicle Emission',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Scam';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(30, 30),
                      backgroundColor: selectedCategory == 'Scam'
                          ? Colors.green
                          : const Color.fromARGB(255, 12, 58, 123)),
                  child: const Text(
                    'Scam',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  String location = Provider.of<LocationProvider>(context, listen: false).address;
                  final newReportData = {
                    'title' : titleController.text,
                    'desc' : descController.text,
                    'location' : location,
                    'category' : selectedCategory
                  };

                  Provider.of<ReportsProvider>(context, listen: false).addReport(context, newReportData);
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserReportScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 12, 58, 123),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleCategorySelection(String category) {
    setState(() {
      selectedCategory = category;
    });
    print('Selected category: $category');
  }
}
