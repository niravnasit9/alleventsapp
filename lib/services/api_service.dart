import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/details_model.dart';
import '../models/category_model.dart';

class ApiService {
  static const String categoryUrl =
      "https://allevents.s3.amazonaws.com/tests/categories.json";

  static Future<List<AllCategory>> getCategories() async {
    final response = await http.get(Uri.parse(categoryUrl));
    if (response.statusCode == 200) {
      final List responseData = json.decode(response.body);
      return responseData.map((e) => AllCategory.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future<List<DetailsModel>> getEvents(String apiUrl) async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List eventsJson = jsonData['item'];
      return eventsJson.map((json) => DetailsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }
}
