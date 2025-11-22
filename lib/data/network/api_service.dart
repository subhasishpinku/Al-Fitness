import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://aipoweredfitness.com/api/',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Response> postRequest(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(url, data: data);

      dynamic resData = response.data;

      // FIX: if the backend returns a JSON STRING, decode it
      if (resData is String) {
        resData = jsonDecode(resData);
      }

      // Also decode inner fields if they are strings
      if (resData is Map && resData['data'] is String) {
        resData['data'] = jsonDecode(resData['data']);
      }

      return Response(
        requestOptions: response.requestOptions,
        data: resData,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message);
    }
  }

  Future<Response> postRequestFood(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    print("📤 POST => $endpoint");
    print("📤 BODY => $data");

    try {
      final response = await _dio.post(endpoint, data: data);
      print("📥 RESPONSE => ${response.data}");
      return response;
    } catch (e) {
      print("❌ API ERROR: $e");
      rethrow;
    }
  }

  Future<Response> register(String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post(endpoint, data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(e.response?.data ?? e.message);
    }
  }
}
