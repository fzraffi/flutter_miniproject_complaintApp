import 'package:dio/dio.dart';

class ReportsService{
  final Dio _dio = Dio();

  final String _baseUrl = 'https://kmcrslkjoptlavxsmeti.supabase.co/rest/v1/';
  final String _apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImttY3JzbGtqb3B0bGF2eHNtZXRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM3NzAxMzUsImV4cCI6MjAyOTM0NjEzNX0.GtaklIut7JNHxyIfe3yl7XpBNXEFZigpCneXkjJTSpk';

  Future<Response> getReports() async{
    var baseUrl = '${_baseUrl}reports?select=*&order=id.desc';
    final response = await _dio.get(
      baseUrl, options: Options(
        headers: {
          'apikey' : _apiKey,
          'Authorization' : 'Bearer $_apiKey'
        },
      ),
    );

  return response;
  }

  Future<Response> addReport(Map<String, dynamic> newReportData) async{
  var baseUrl = 'https://kmcrslkjoptlavxsmeti.supabase.co/rest/v1/reports';
  final response = await _dio.post(
    baseUrl,
    data: newReportData,
    options: Options(
      headers: {
          'apikey' : _apiKey,
          'Authorization' : 'Bearer $_apiKey',
          'Content-Type' : 'application/json',
          'Prefer' : 'return=representation'
        },
    )
  );
  
  return response;
  }

  Future<Response> deleteReport(int reportId) async{
    var baseUrl = '${_baseUrl}reports?id=eq.$reportId';
    final response = await _dio.delete(
      baseUrl,
      options: Options(
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_apiKey',
        },
      ),
    );
    return response;
  }

}