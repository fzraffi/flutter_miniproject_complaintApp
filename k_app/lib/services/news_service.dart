import 'package:dio/dio.dart';

class NewsService{
  final Dio _dio = Dio();

  final String _baseUrl = 'https://kmcrslkjoptlavxsmeti.supabase.co/rest/v1/';
  final String _apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImttY3JzbGtqb3B0bGF2eHNtZXRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM3NzAxMzUsImV4cCI6MjAyOTM0NjEzNX0.GtaklIut7JNHxyIfe3yl7XpBNXEFZigpCneXkjJTSpk';

  Future<Response> getNews() async{
    var baseUrl = '${_baseUrl}news?select=*&order=id.desc';
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
}