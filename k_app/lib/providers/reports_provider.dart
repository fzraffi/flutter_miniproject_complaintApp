import 'package:flutter/material.dart';
import 'package:k_app/models/reports_model.dart';
import 'package:k_app/services/reports_service.dart';

class ReportsProvider extends ChangeNotifier {
  final ReportsService _reportsService = ReportsService();

  List<ReportsModel>? _reports;
  bool _isLoaded = false;

  List<ReportsModel>? get reports => _reports;
  bool get isLoaded => _isLoaded;

  Future<void> getReports() async {
    try {
      _isLoaded = true;
      final response = await _reportsService.getReports();
      if (response.statusCode == 200) {
        _reports = (response.data as List<dynamic>)
            .map((e) => ReportsModel.fromJson(e))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error $e');
    } finally {
      _isLoaded = false;
    }
  }

  void addReport(
      BuildContext context, Map<String, dynamic> newReportData) async {
    _isLoaded = true;
    notifyListeners();
    try {
      final response = await _reportsService.addReport(newReportData);
      if (response.statusCode == 201) {
        getReports();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Report added failed'),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error $e');
    } finally {
      _isLoaded = false;
    }
  }

  void deleteReport(int reportId) async {
    _isLoaded = true;
    notifyListeners();
    try {
      final response = await _reportsService.deleteReport(reportId);
      if (response.statusCode == 204) {
        getReports();
      }
    } catch (e) {
      debugPrint('$e');
    } finally {
      _isLoaded = false;
    }
  }
}
