import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeightTodayViewModel extends ChangeNotifier {
  final TextEditingController weightController = TextEditingController();
  final List<WeightEntry> _history = [];

  List<WeightEntry> get history => _history;

  void submitWeight(BuildContext context) {
    final text = weightController.text.trim();
    if (text.isNotEmpty) {
      final double? weight = double.tryParse(text);
      if (weight != null) {
        _history.insert(0, WeightEntry(weight, DateTime.now()));
        weightController.clear();
        notifyListeners();

        //  Show success dialog
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Directionality(
              textDirection: TextDirection.ltr,
              child: const Text(
                "Success 🎉",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            content: Directionality(
              textDirection: TextDirection.ltr,
              child: const Text("Your information has been recorded"),
            ),
            actions: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  void deleteWeight(int index) {
    _history.removeAt(index);
    notifyListeners();
  }

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }
}

class WeightEntry {
  final double weight;
  final DateTime time;

  WeightEntry(this.weight, this.time);
}

class WeightPage extends StatelessWidget {
  const WeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WeightTodayViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Weight Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: viewModel.weightController,
              decoration: const InputDecoration(
                labelText: "Enter your weight (kg)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.submitWeight(context), //  pass context
              child: const Text("Submit"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.history.length,
                itemBuilder: (context, index) {
                  final entry = viewModel.history[index];
                  return ListTile(
                    title: Text("${entry.weight} Kg"),
                    subtitle: Text(entry.time.toString()),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => viewModel.deleteWeight(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
