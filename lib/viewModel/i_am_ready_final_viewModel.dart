import 'package:aifitness/models/workout_exercise_model.dart';
import 'package:aifitness/repository/IamReadyFinalRepository.dart';
import 'package:aifitness/res/widgets/ExerciseTrackerDialog.dart';
import 'package:flutter/material.dart';

class IamReadyFinalViewModel extends ChangeNotifier {
  final IamReadyFinalRepository _repo = IamReadyFinalRepository();

  bool loading = false;
  String errorMessage = "";
  List<WorkoutExerciseModel> exercises = [];

  Future<void> getExercises({
    required String deviceId,
    required int userId,
    required String day,
  }) async {
    loading = true;
    errorMessage = "";
    notifyListeners();

    try {
      exercises = await _repo.fetchExercises(deviceId, userId, day);
      print("API Exercise Count = ${exercises.length}");
    } catch (e) {
      errorMessage = e.toString();
      print("errr $errorMessage");
    }

    loading = false;
    notifyListeners();
  }

  void onTrackPressed(BuildContext context, WorkoutExerciseModel exercise) {
    showDialog(
      context: context,
      builder: (_) => ExerciseTrackerDialog(exerciseName: exercise.name ?? ""),
    );
  }

  void onHistoryPressed(BuildContext context, WorkoutExerciseModel exercise) {}
}
