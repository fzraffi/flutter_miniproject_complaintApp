import 'package:flutter/material.dart';
import 'package:k_app/providers/reports_provider.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:provider/provider.dart';

class UserReportScreen extends StatefulWidget {
  const UserReportScreen({super.key});

  @override
  State<UserReportScreen> createState() => _UserReportScreenState();
}

class _UserReportScreenState extends State<UserReportScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ReportsProvider>(context, listen: false).getReports();
  }

  @override
  Widget build(BuildContext context) {
    final reportsProvider = Provider.of<ReportsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 58, 123),
        title: const Text(
          'My Report',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 187, 210, 255),
        child: Consumer<ReportsProvider>(
          builder: (context, value, child) => ListView.builder(
              itemCount: reportsProvider.reports?.length ?? 0,
              itemBuilder: (context, index) {
                final reports = reportsProvider.reports?[index];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    reports!.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 12, 58, 123),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Colors.red,
                                    child: IconButton(
                                        onPressed: () {
                                          showDialog(context: context, builder: (context){
                                            return AlertDialog(
                                              title: const Text('Delete Report'),
                                              content: const Text('Are you sure want to delete this report?'),
                                              actions: [
                                                TextButton(onPressed: (){
                                                  Navigator.of(context).pop();
                                                }, child: Text('Cancel'),),
                                                TextButton(onPressed: (){
                                                  // Method delete
                                                  Provider.of<ReportsProvider>(context, listen: false).deleteReport(reports.id);
                                                  Navigator.of(context).pop();
                                                }, child: Text('Delete'))
                                              ],
                                            );
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 25,
                                        )),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(reports.desc),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(
                                      width: 8), // Spasi antara ikon dan teks
                                  Expanded(
                                    child: Text(
                                      reports.location,
                                      style: const TextStyle(
                                        color: Colors.green,
                                      ),
                                      overflow: TextOverflow
                                          .ellipsis, // Perilaku ketika teks melebihi batas
                                      maxLines: 2, // Maksimum dua baris teks
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.list,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    '  ${reports.category}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Status : Follow up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              LinearProgressBar(
                                maxSteps: 6,
                                progressType: LinearProgressBar
                                    .progressTypeLinear, // Use Linear progress
                                currentStep: 1,
                                progressColor: Colors.green,
                                backgroundColor: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
