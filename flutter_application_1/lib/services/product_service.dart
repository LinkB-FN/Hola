import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  static const String baseUrl = "http://localhost:8090/market-app/api"; // Usa http://10.0.2.2:8090 para emulador Android

  static Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    print('Token: $token');
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    } else {
      print('No auth token found');
    }
    return headers;
  }

  static Future<List<Product>> getAllProducts() async {
    final headers = await _getHeaders();
    try {
      print('Request URL: $baseUrl/products');
      print('Headers: $headers');
      final response = await http.get(
        Uri.parse("$baseUrl/products"),
        headers: headers,
      );
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception("Error al cargar productos: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print('Error fetching products: $e');
      throw e;
    }
  }

  static Future<List<Product>> getProductsByCategory(int categoryId) async {
    final headers = await _getHeaders();
    try {
      print('Request URL: $baseUrl/products/category/$categoryId');
      print('Headers: $headers');
      final response = await http.get(
        Uri.parse("$baseUrl/products/category/$categoryId"),
        headers: headers,
      );
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception("Error al cargar productos por categoría: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print('Error fetching products by category: $e');
      throw e;
    }
  }
}