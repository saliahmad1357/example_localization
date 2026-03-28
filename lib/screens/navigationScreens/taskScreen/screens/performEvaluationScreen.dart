
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/isar/evaluationIsar.dart';
import '../../../../models/isar/taskIsar.dart';
import '../../../../models/isar/taskScoreIsar.dart';
import '../../../../providers/taskProvider.dart';
import '../../../../providers/taskScoreProvider.dart';

class PerformEvaluationScreen extends ConsumerStatefulWidget {
  final EvaluationIsar evaluation;

  const PerformEvaluationScreen({
    required this.evaluation,
    super.key,
  });

  @override
  ConsumerState<PerformEvaluationScreen> createState() =>
      _PerformEvaluationScreenState();
}

class _PerformEvaluationScreenState
    extends ConsumerState<PerformEvaluationScreen> {
  final Map<int, bool> _results = {};
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    final tasksAsync = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.evaluation.name} ${tr('evaluationTitle')}'),
        actions: [
          if (!_isSaving)
            IconButton(
              onPressed: _submitEvaluation,
              icon: const Icon(Icons.check_circle, size: 28),
            ),
        ],
      ),
      body: tasksAsync.when(
        data: (tasks) {
          final relevantTasks = _filterTasks(tasks);

          if (relevantTasks.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.task_alt, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      tr('noTasksForEvaluation') ?? 'No tasks found for this evaluation.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        tr('evaluationInstruction') ?? 'Mark the tasks you completed successfully.',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: relevantTasks.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    final task = relevantTasks[index];
                    final isChecked = _results[task.id] ?? false;

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: CheckboxListTile(
                        title: Text(task.titleEn),
                        subtitle: Text(task.descriptionEn),
                        value: isChecked,
                        onChanged: (val) {
                          setState(() {
                            _results[task.id] = val ?? false;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _submitEvaluation,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isSaving
                      ? const CircularProgressIndicator()
                      : Text(tr('submitEvaluation') ?? 'Submit Evaluation'),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }

  List<TaskIsar> _filterTasks(List<TaskIsar> allTasks) {
    final type = widget.evaluation.name.toLowerCase();
    
    return allTasks.where((t) {
      if (!t.isActive) return false;

      if (type == 'daily' && t.dayOfWeek == null && t.dayOfMonth == null) {
        return true;
      }
      if (type == 'weekly' && t.dayOfWeek != null) {
        return t.dayOfWeek == widget.evaluation.dayOfWeek;
      }
      if (type == 'monthly' && t.dayOfMonth != null) {
        return t.dayOfMonth == widget.evaluation.dayOfMonth;
      }
      
      return false;
    }).toList();
  }

  Future<void> _submitEvaluation() async {
    setState(() => _isSaving = true);
    
    try {
      final tasks = ref.read(taskProvider).asData?.value ?? [];
      final relevantTasks = _filterTasks(tasks);
      final now = DateTime.now();

      // Automated Scoring: 
      // 100 for completed, 0 for not
      // (If you want more complex grading, this is where it goes)
      
      for (final task in relevantTasks) {
        final isCompleted = _results[task.id] ?? false;
        final score = isCompleted ? 100 : 0;

        final newScore = TaskScoreIsar()
          ..userId = task.userId
          ..taskId = task.id
          ..frequencyId = task.frequencyId
          ..frequencyName = widget.evaluation.name
          ..score = score
          ..date = now
          ..createdAt = now
          ..uniqueKey = '${task.id}-${task.userId}-${task.frequencyId}-${now.toIso8601String().substring(0, 10)}';

        await ref.read(taskScoreProvider.notifier).addTaskScore(newScore);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(tr('evaluationSaved') ?? 'Evaluation saved successfully!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }
}
