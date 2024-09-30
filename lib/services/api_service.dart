import 'dart:async';
import 'dart:convert';
import 'package:mvc_api/models/data_model.dart';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;
class ApiService {
  Future<bool> login(UserModel user) async {
    try {
      // Create the request payload (you can modify this based on your API)
      final body = jsonEncode({
        'email': user.email,
        'password': user.password,
      });

      // Send the POST request
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Assuming the API returns a success message or token in response
        // Optionally: parse response body here if needed
        return true;  // Login successful
      } else {
        // Handle other status codes (e.g., 401 for unauthorized)
        return false;  // Login failed
      }
    } catch (e) {
      // Handle any errors, e.g., network issues
      print("Login failed: $e");
      return false;
    }
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://api.restful-api.dev/objects'));

    if (response.statusCode == 200) {
      print("response :${response.body}");
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product?> fetchProductById(String id) async {
    final response = await http.get(Uri.parse('https://api.restful-api.dev/objects/$id'));

    if (response.statusCode == 200) {
      print("response :${response.body}");
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Product.fromJson(jsonResponse);  // Parse a single product
    } else {
      throw Exception('Failed to load products');
    }
  }
}
