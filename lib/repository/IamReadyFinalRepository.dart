import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:aifitness/models/workout_exercise_model.dart';

class IamReadyFinalRepository {
  final Dio _dio;
  static const String BASE_URL =
      "https://aipoweredfitness.com"; // CHANGE to your base

  IamReadyFinalRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<WorkoutExerciseModel>> fetchExercises(
    String deviceId,
    int userId,
    String day,
  ) async {
    try {
      final response = await _dio.post(
        "$BASE_URL/api/get-full-body-plan-workouts-new-ai-app",
        data: {"device_id": deviceId, "user_id": userId, "day": day},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        // If data is string, try decode
        final Map<String, dynamic> root = data is Map<String, dynamic>
            ? data
            : jsonDecode(data.toString());

        final exercisesRaw = root['data']?['exercises'];
        if (exercisesRaw == null) return [];

        // exercisesRaw might be List<Map> or a JSON string
        final List items = exercisesRaw is List
            ? exercisesRaw
            : jsonDecode(exercisesRaw.toString());
        final List<WorkoutExerciseModel> list = items.map<WorkoutExerciseModel>(
          (e) {
            final itemMap = e is Map<String, dynamic>
                ? e
                : Map<String, dynamic>.from(e);
            return WorkoutExerciseModel.fromJson(itemMap);
          },
        ).toList();

        return list;
      } else {
        throw Exception("API error: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
