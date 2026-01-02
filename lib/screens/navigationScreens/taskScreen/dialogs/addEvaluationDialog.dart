import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/isar/evaluationIsar.dart';
import '../../../../providers/evaluationProvider.dart';

class AddEvaluationDialog extends ConsumerStatefulWidget {
  const AddEvaluationDialog({super.key});

  @override
  ConsumerState<AddEvaluationDialog> createState() =>
      _AddEvaluationDialogState();
}

class _AddEvaluationDialogState extends ConsumerState<AddEvaluationDialog> {
  late TextEditingController nameController;
  late TextEditingController soundController;
  int selectedHour = 9;
  int selectedMinute = 0;
  int frequencyType = 1; // 1=Daily, 2=Weekly, 3=Monthly
  int? selectedDayOfWeek; // 1-7 for weekly
  int? selectedDayOfMonth; // 1-31 for monthly

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    soundController = TextEditingController(text: 'notification');
  }

  @override
  void dispose() {
    nameController.dispose();
    soundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Evaluation'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Evaluation Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int>(
              value: frequencyType,
              decoration: const InputDecoration(
                labelText: 'Frequency Type',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 1, child: Text('Daily')),
                DropdownMenuItem(value: 2, child: Text('Weekly')),
                DropdownMenuItem(value: 3, child: Text('Monthly')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    frequencyType = value;
                    selectedDayOfWeek = null;
                    selectedDayOfMonth = null;
                  });
                }
              },
            ),
            const SizedBox(height: 12),
            if (frequencyType == 2)
              DropdownButtonFormField<int>(
                value: selectedDayOfWeek ?? 1,
                decoration: const InputDecoration(
                  labelText: 'Day of Week',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 1, child: Text('Monday')),
                  DropdownMenuItem(value: 2, child: Text('Tuesday')),
                  DropdownMenuItem(value: 3, child: Text('Wednesday')),
                  DropdownMenuItem(value: 4, child: Text('Thursday')),
                  DropdownMenuItem(value: 5, child: Text('Friday')),
                  DropdownMenuItem(value: 6, child: Text('Saturday')),
                  DropdownMenuItem(value: 7, child: Text('Sunday')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedDayOfWeek = value;
                    });
                  }
                },
              ),
            if (frequencyType == 3)
              DropdownButtonFormField<int>(
                value: selectedDayOfMonth ?? 1,
                decoration: const InputDecoration(
                  labelText: 'Day of Month',
                  border: OutlineInputBorder(),
                ),
                items: List.generate(
                  31,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text((index + 1).toString()),
                  ),
                ),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedDayOfMonth = value;
                    });
                  }
                },
              ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: selectedHour,
                    decoration: const InputDecoration(
                      labelText: 'Hour',
                      border: OutlineInputBorder(),
                    ),
                    items: List.generate(
                      24,
                      (index) => DropdownMenuItem(
                        value: index,
                        child: Text(index.toString().padLeft(2, '0')),
                      ),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedHour = value;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: selectedMinute,
                    decoration: const InputDecoration(
                      labelText: 'Minute',
                      border: OutlineInputBorder(),
                    ),
                    items: List.generate(
                      60,
                      (index) => DropdownMenuItem(
                        value: index,
                        child: Text(index.toString().padLeft(2, '0')),
                      ),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedMinute = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: soundController,
              decoration: const InputDecoration(
                labelText: 'Sound File',
                hintText: 'e.g., notification',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveEvaluation,
          child: const Text('Save'),
        ),
      ],
    );
  }

  void _saveEvaluation() async {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an evaluation name')),
      );
      return;
    }

    final newEvaluation = EvaluationIsar()
      ..userId = 1 // Default user ID
      ..name = nameController.text
      ..sound = soundController.text
      ..hour = selectedHour
      ..minute = selectedMinute
      ..dayOfWeek = frequencyType == 2 ? selectedDayOfWeek : null
      ..dayOfMonth = frequencyType == 3 ? selectedDayOfMonth : null;

    try {
      await ref.read(evaluationProvider.notifier).addEvaluation(newEvaluation);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Evaluation added successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
