import 'package:flutter/material.dart';

class ExerciseTrackerDialog extends StatelessWidget {
  final String exerciseName;

  const ExerciseTrackerDialog({super.key, required this.exerciseName});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final formattedDate = "${_monthName(date.month)} ${date.day}, ${date.year}";

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------- Header ----------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "EXERCISE TRACKER",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  formattedDate,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  exerciseName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),

                _buildSetSection("Set 1 (Warm-Up Set)", "25", "8"),
                const SizedBox(height: 12),
                _buildSetSection("Set 2 (Failure Set)", "20", "6"),
                const SizedBox(height: 12),
                _buildSetSection("Set 3 (Pump Set)", "30", "6"),

                const SizedBox(height: 22),

                // ---------- Save Button ----------
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.blue),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSetSection(String title, String weight, String reps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
        ),
        const SizedBox(height: 8),

        _valueBox("Weight:", weight),
        const SizedBox(height: 6),
        _valueBox("REPS:", reps),
      ],
    );
  }

  Widget _valueBox(String label, String value) {
    return Container(
      height: 42,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFCCEEFF),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.centerLeft,
      child: Text(
        "$label  $value",
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }

  static String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
