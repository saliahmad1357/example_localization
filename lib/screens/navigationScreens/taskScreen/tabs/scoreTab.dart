import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/isar/taskScoreIsar.dart';
import '../../../../models/isar/evaluationIsar.dart';
import '../../../../providers/taskScoreProvider.dart';
import '../../../../providers/taskProvider.dart';
import '../../../../providers/frequencyProvider.dart';
import '../../../../providers/evaluationProvider.dart';
import '../utils/taskLocalizationHelper.dart';

class ScoreTab extends ConsumerStatefulWidget {
  const ScoreTab({super.key});

  @override
  ConsumerState<ScoreTab> createState() => _ScoreTabState();
}

class _ScoreTabState extends ConsumerState<ScoreTab> {
  late DateTime selectedDate;
  late int selectedFrequencyId;
  List<String> frequencyNames = ['Daily', 'Weekly', 'Monthly'];
  List<int> frequencyIds = [1, 2, 3];

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedFrequencyId = 1; // Default to Daily
  }

  DateTime _normalizeDate(int frequencyId, DateTime date) {
    switch (frequencyId) {
      case 1: // DAILY
        return DateTime(date.year, date.month, date.day);
      case 2: // WEEKLY
        final monday = date.subtract(Duration(days: date.weekday - 1));
        return DateTime(monday.year, monday.month, monday.day);
      case 3: // MONTHLY
        return DateTime(date.year, date.month, 1);
      default:
        return DateTime(date.year, date.month, date.day);
    }
  }

  /// Filter evaluations by frequency
  /// Daily: return evaluations with frequencyId == 1
  /// Weekly: return evaluations with frequencyId == 2
  /// Monthly: return evaluations with frequencyId == 3
  List<EvaluationIsar> _filterEvaluationsByFrequency(
      List<EvaluationIsar> evaluations, int frequencyId) {
    return evaluations.where((eval) {
      if (frequencyId == 1) {
        // Daily - no dayOfWeek or dayOfMonth
        return eval.dayOfWeek == null && eval.dayOfMonth == null;
      } else if (frequencyId == 2) {
        // Weekly - has dayOfWeek
        return eval.dayOfWeek != null;
      } else if (frequencyId == 3) {
        // Monthly - has dayOfMonth
        return eval.dayOfMonth != null;
      }
      return false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final scoresAsync = ref.watch(taskScoreProvider);
    final tasksAsync = ref.watch(taskProvider);
    final frequencyAsync = ref.watch(frequencyProvider);
    final evaluationAsync = ref.watch(evaluationProvider);

    final scores = scoresAsync.asData?.value ?? [];
    final tasks = tasksAsync.asData?.value ?? [];
    final frequencies = frequencyAsync.asData?.value ?? [];
    final evaluations = evaluationAsync.asData?.value ?? [];

    // Get frequency name
    String getFrequencyName(int id) {
      try {
        return frequencies.firstWhere((f) => f.id == id).name;
      } catch (e) {
        return ['Daily', 'Weekly', 'Monthly'][id - 1];
      }
    }

    // Create a map of taskId -> taskName (localized)
    final taskNameMap = {
      for (var task in tasks) task.id: getLocalizedTitle(task, context)
    };

    final normalizedDate = _normalizeDate(selectedFrequencyId, selectedDate);
    final frequencyName = getFrequencyName(selectedFrequencyId);

    // Filter scores by frequency and date
    final filteredScores = scores
        .where((score) =>
            score.frequencyId == selectedFrequencyId &&
            score.createdAt.year == normalizedDate.year &&
            score.createdAt.month == normalizedDate.month &&
            score.createdAt.day == normalizedDate.day)
        .toList();

    // Filter evaluations by frequency
    final filteredEvaluations =
        _filterEvaluationsByFrequency(evaluations, selectedFrequencyId);


    // Calculate total score
    int totalScore = 0;
    int maxScore = 0;
    for (var score in filteredScores) {
      if (score.score >= 0) {
        totalScore += score.score;
      }
      maxScore += 2; // Max score per task is 2
    }

    return Column(
      children: [
        // === Filters ===
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // Frequency Selector
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<int>(
                      isExpanded: true,
                      value: selectedFrequencyId,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedFrequencyId = value;
                          });
                        }
                      },
                      items: frequencyIds.map((id) {
                        return DropdownMenuItem(
                          value: id,
                          child: Text(getFrequencyName(id)),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Date Picker
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).dividerColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          DateFormat('MMM dd, yyyy').format(selectedDate),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        // === Evaluations for this frequency ===
        if (filteredEvaluations.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(12),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Scheduled Evaluations',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: filteredEvaluations.map((eval) {
                    final timeString =
                        '${eval.hour.toString().padLeft(2, '0')}:${eval.minute.toString().padLeft(2, '0')}';
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.notifications_active,
                            size: 16,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${eval.name} @ $timeString',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        const Divider(),
        // === Score List ===
        Expanded(
          child: filteredScores.isEmpty
              ? Center(
                  child: Text(
                    'No scores for this $frequencyName',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: filteredScores.length,
                  itemBuilder: (context, index) {
                    final score = filteredScores[index];
                    final taskName = taskNameMap[score.taskId] ?? 'Unknown Task';
                    return _ScoreTile(
                      score: score,
                      taskName: taskName,
                    );
                  },
                ),
        ),
        // === Total Score ===
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Score',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '$totalScore / $maxScore',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScoreTile extends ConsumerWidget {
  final TaskScoreIsar score;
  final String taskName;

  const _ScoreTile({
    required this.score,
    required this.taskName,
  });

  DateTime _normalizeDate(int frequencyId, DateTime date) {
    switch (frequencyId) {
      case 1: // DAILY
        return DateTime(date.year, date.month, date.day);
      case 2: // WEEKLY
        final monday = date.subtract(Duration(days: date.weekday - 1));
        return DateTime(monday.year, monday.month, monday.day);
      case 3: // MONTHLY
        return DateTime(date.year, date.month, 1);
      default:
        return DateTime(date.year, date.month, date.day);
    }
  }

  bool _isPeriodPassed(int frequencyId, DateTime createdAt) {
    final now = DateTime.now();
    // Normalize both dates using the same frequency logic
    final normalizedNow = _normalizeDate(frequencyId, now);
    final normalizedCreatedAt = _normalizeDate(frequencyId, createdAt);
    return normalizedNow.isAfter(normalizedCreatedAt);
  }

  Color _getColor(int score) {
    switch (score) {
      case -1:
        return Colors.red;
      case 0:
        return Colors.grey;
      case 1:
        return Colors.green;
      case 2:
        return Colors.green.shade800;
      default:
        return Colors.grey;
    }
  }

  String _getScoreLabel(int score) {
    switch (score) {
      case -1:
        return tr('scoreOptionNotPerformed');
      case 0:
        return tr('scoreOptionLate');
      case 1:
        return tr('scoreOptionOnTime');
      case 2:
        return tr('scoreOptionExcellent');
      default:
        return 'Unknown';
    }
  }

  IconData _getScoreIcon(int score) {
    switch (score) {
      case -1:
        return Icons.close;
      case 0:
        return Icons.remove_circle;
      case 1:
        return Icons.check_circle;
      case 2:
        return Icons.verified;
      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateString = score.date.toString().split(' ')[0];
    final isPeriodPassed = _isPeriodPassed(score.frequencyId, score.createdAt);
    final scoreNotifier = ref.read(taskScoreProvider.notifier);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              _showScoreDialog(context, ref, scoreNotifier, isPeriodPassed);
            },
            child: CircleAvatar(
              radius: 22,
              backgroundColor: _getColor(score.score).withOpacity(0.15),
              child: Icon(
                _getScoreIcon(score.score),
                color: _getColor(score.score),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      score.frequencyName,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      dateString,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    if (isPeriodPassed)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          '(Passed)',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _showScoreDialog(context, ref, scoreNotifier, isPeriodPassed);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getColor(score.score).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _getScoreLabel(score.score),
                style: TextStyle(
                  color: _getColor(score.score),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showScoreDialog(
    BuildContext context,
    WidgetRef ref,
    TaskScoreNotifier scoreNotifier,
    bool isPeriodPassed,
  ) {
    int tempScore = score.score;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Change Score'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isPeriodPassed)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Period passed - Only Late allowed',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                Slider(
                  min: 0,
                  max: 3,
                  divisions: 3,
                  value: (tempScore + 1).clamp(0, 3).toDouble(),
                  onChanged: (value) {
                    int newScore = value.toInt() - 1;
                    
                    // If period passed, only allow score 0
                    if (isPeriodPassed && newScore > 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                              'Period passed - Only Late (score 0) allowed'),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                      return;
                    }
                    
                    setState(() {
                      tempScore = newScore;
                    });
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  _getScoreLabel(tempScore),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _getColor(tempScore),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  final updatedScore = TaskScoreIsar()
                    ..id = score.id
                    ..taskId = score.taskId
                    ..userId = score.userId
                    ..frequencyId = score.frequencyId
                    ..frequencyName = score.frequencyName
                    ..createdAt = score.createdAt
                    ..date = score.date
                    ..score = tempScore
                    ..uniqueKey = score.uniqueKey;

                  await scoreNotifier.updateTaskScore(updatedScore);
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      ),
    );
  }
}