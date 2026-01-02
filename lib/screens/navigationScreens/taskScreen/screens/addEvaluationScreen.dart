import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/isar/evaluationIsar.dart';
import '../../../../providers/evaluationProvider.dart';

class AddEvaluationScreen extends ConsumerStatefulWidget {
  final EvaluationIsar? evaluation; // If null, it's an add operation; otherwise, it's an edit

  const AddEvaluationScreen({
    this.evaluation,
    super.key,
  });

  @override
  ConsumerState<AddEvaluationScreen> createState() =>
      _AddEvaluationScreenState();
}

class _AddEvaluationScreenState extends ConsumerState<AddEvaluationScreen> {
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
    if (widget.evaluation != null) {
      // Prefill values for edit mode
      nameController = TextEditingController(text: widget.evaluation!.name);
      soundController =
          TextEditingController(text: widget.evaluation!.sound);
      selectedHour = widget.evaluation!.hour;
      selectedMinute = widget.evaluation!.minute;
      selectedDayOfWeek = widget.evaluation!.dayOfWeek ?? 1;
      selectedDayOfMonth = widget.evaluation!.dayOfMonth ?? 1;
      // Determine frequency type from presence of dayOfWeek/dayOfMonth
      if (widget.evaluation!.dayOfWeek != null) {
        frequencyType = 2;
      } else if (widget.evaluation!.dayOfMonth != null) {
        frequencyType = 3;
      } else {
        frequencyType = 1;
      }
    } else {
      // Initialize for add mode
      nameController = TextEditingController();
      soundController = TextEditingController(text: 'notification');
      selectedDayOfWeek = 1;
      selectedDayOfMonth = 1;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    soundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.evaluation != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Evaluation' : 'Add New Evaluation'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Basic Information Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Basic Information',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Evaluation Name',
                        hintText: 'Enter evaluation name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: soundController,
                      decoration: const InputDecoration(
                        labelText: 'Sound File',
                        hintText: 'e.g., notification',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.music_note),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Frequency Configuration Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Frequency Configuration',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<int>(
                      value: frequencyType,
                      decoration: const InputDecoration(
                        labelText: 'Frequency Type',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
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
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 24),

                    // Weekly Day Selector
                    if (frequencyType == 2) ...[
                      Text(
                        'Select Day of Week',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<int>(
                        value: selectedDayOfWeek ?? 1,
                        decoration: const InputDecoration(
                          labelText: 'Day of Week',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_view_week),
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
                      const SizedBox(height: 24),
                    ],

                    // Monthly Day Selector
                    if (frequencyType == 3) ...[
                      Text(
                        'Select Day of Month',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<int>(
                        value: selectedDayOfMonth ?? 1,
                        decoration: const InputDecoration(
                          labelText: 'Day of Month (1-31)',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_month),
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
                      const SizedBox(height: 24),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Time Configuration Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time Configuration',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Select Time',
                      style: Theme.of(context).textTheme.labelLarge,
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
                              prefixIcon: Icon(Icons.schedule),
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
                              prefixIcon: Icon(Icons.more_time),
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
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.close),
                    label: const Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.check),
                    label: Text(widget.evaluation != null
                        ? 'Update Evaluation'
                        : 'Save Evaluation'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: _saveEvaluation,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _saveEvaluation() async {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an evaluation name')),
      );
      return;
    }

    try {
      if (widget.evaluation != null) {
        // Edit mode - update existing evaluation
        final updatedEvaluation = widget.evaluation!
          ..name = nameController.text
          ..sound = soundController.text
          ..hour = selectedHour
          ..minute = selectedMinute
          ..dayOfWeek = frequencyType == 2 ? selectedDayOfWeek : null
          ..dayOfMonth = frequencyType == 3 ? selectedDayOfMonth : null;

        await ref
            .read(evaluationProvider.notifier)
            .updateEvaluation(updatedEvaluation);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Evaluation updated successfully')),
        );
      } else {
        // Add mode - create new evaluation
        final newEvaluation = EvaluationIsar()
          ..userId = 1
          ..name = nameController.text
          ..sound = soundController.text
          ..hour = selectedHour
          ..minute = selectedMinute
          ..dayOfWeek = frequencyType == 2 ? selectedDayOfWeek : null
          ..dayOfMonth = frequencyType == 3 ? selectedDayOfMonth : null;

        await ref.read(evaluationProvider.notifier).addEvaluation(newEvaluation);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Evaluation added successfully')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
