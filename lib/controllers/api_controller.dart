import 'dart:convert';

import 'package:alleventsapp/constants/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/category.dart';

class ApiController extends GetxController {
  var categories = <Category>[].obs;

  // Fetch the categories data from the API
  Future<void> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(ApiPath.category_all));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        categories.value = jsonResponse.map((data) => Category.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }
}

