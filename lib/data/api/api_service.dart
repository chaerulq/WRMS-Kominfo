import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/proyeksaatini_model.dart';

class ApiServices {
  static const String _baseUrl = '10.98.33.36/api/v1/dashboard/projek-saat-ini';
  static const String _apiKey = '5d4aa4354567426ab5769a414fede321';
  static const String _country = 'id';

  Future<Proyek> proyekSaatIni() async {
    final response = await http.get(
      Uri.parse(
          "${_baseUrl}top-headlines?country=$_country&category=general&apiKey=$_apiKey"),
    );
    if (response.statusCode == 200) {
      return Proyek.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load general news');
    }
  }
}
