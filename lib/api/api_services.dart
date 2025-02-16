import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  final String baseUrl;
  ApiService({required this.baseUrl});

  Future<Response> get({required String endpoint}) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl$endpoint"),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 40));

      if (response.statusCode == 200) {
        return response;
      }
      return response;
    } on SocketException {
      throw "No Internet connection. Please check your network.";
    } on TimeoutException {
      throw "Request timed out. Try again later.";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
