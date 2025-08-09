import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_learning/Future%20Provider/employee_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Employee>> getUsers() async {
    try {
      final response = await _dio.get(
        'https://synergysoftindia.com/attcore/api/get-employees-list',
      );

      if (kDebugMode) {
        print('Row response: ${response.data}');
      }

      if (response.statusCode == 200 && response.data['status'] == true) {
        final List<dynamic> rawList = response.data['data'];
        return rawList.map((json) => Employee.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected error: [${response.statusCode}]');
      }
    } catch (e) {
      debugPrint('$e');
      throw Exception('Error: $e');
    }
  }
}
