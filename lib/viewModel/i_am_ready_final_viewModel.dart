import 'package:aifitness/models/exercise_tracker_model.dart';
import 'package:aifitness/models/workout_exercise_model.dart';
import 'package:aifitness/repository/IamReadyFinalRepository.dart';
import 'package:aifitness/repository/exercise_tracker_repository.dart';
import 'package:aifitness/res/widgets/ExerciseHistoryDialog.dart';
import 'package:aifitness/res/widgets/ExerciseTrackerDialog.dart';
import 'package:flutter/material.dart';

class IamReadyFinalViewModel extends ChangeNotifier {
  final IamReadyFinalRepository _repo = IamReadyFinalRepository();
  final repo1 = ExerciseTrackerRepository();

  bool loading = false;
  String errorMessage = "";
  List<WorkoutExerciseModel> exercises = [];
  List<ExerciseTrackerModel> history = [];

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

  onTrackPressed(
    BuildContext context,
    WorkoutExerciseModel exercise,
    int userId,
  ) {
    showDialog(
      context: context,
      builder: (_) => ExerciseTrackerDialog(
        exerciseName: exercise.name,
        exerciseID: exercise.id,
        userId: userId,
      ),
    );
  }

  // void onTrackPressed(BuildContext context, WorkoutExerciseModel exercise, int userId) {
  //   showDialog(
  //     context: context,
  //     builder: (_) => ExerciseTrackerDialog(
  //       exerciseName: exercise.name ?? "",
  //       exerciseID: exercise.id ?? 0,
  //       userId: userId ?? 0,

  //     ),
  //   );
  // }

  Future fetchExerciseTracker(int userId, int exerciseId) async {
    loading = true;
    notifyListeners();

    try {
      history = await repo1.getExerciseHistory(userId, exerciseId);
      print("history $history");
    } catch (e) {
      debugPrint("Error in getExerciseTracker -> $e");
    }

    loading = false;
    notifyListeners();
  }

  void onHistoryPressed(
    BuildContext context,
    WorkoutExerciseModel exercise,
    int userId,
  ) {
    showDialog(
      context: context,
      builder: (_) => ExerciseHistoryDialog(
        exerciseName: exercise.name ?? "",
        exerciseID: exercise.id ?? 0,
        userId: userId ?? 0,
      ),
    );
  }
}
