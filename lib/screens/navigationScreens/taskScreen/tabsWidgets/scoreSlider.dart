import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/isar/taskIsar.dart';
import '../../../../models/isar/taskScoreIsar.dart';
import '../../../../providers/taskScoreProvider.dart';

DateTime normalizeDate(int frequencyId) {
  final now = DateTime.now();

  switch (frequencyId) {
    case 1: // DAILY
      return DateTime(now.year, now.month, now.day);
    case 2: // WEEKLY
      final monday = now.subtract(Duration(days: now.weekday - 1));
      return DateTime(monday.year, monday.month, monday.day);
    case 3: // MONTHLY
      return DateTime(now.year, now.month, 1);
    default:
      return DateTime(now.year, now.month, now.day);
  }
}

String getFrequencyName(int id, Map<int, String> cache) {
  if (cache.containsKey(id)) {
    return cache[id]!;
  }
  switch (id) {
    case 1:
      return tr('frequenciesDaily');
    case 2:
      return tr('frequenciesWeekly');
    case 3:
      return tr('frequenciesMonthly');
    default:
      return tr('frequenciesDaily');
  }
}

class ScoreSlider extends ConsumerStatefulWidget {
  final TaskIsar item;
  final Map<int, String> frequencyCache;

  const ScoreSlider({
    required this.item,
    required this.frequencyCache,
    super.key,
  });

  @override
  ConsumerState<ScoreSlider> createState() => _ScoreSliderState();
}

class _ScoreSliderState extends ConsumerState<ScoreSlider> {
  late int currentScore;
  late double sliderValue;

  @override
  void initState() {
    super.initState();
    _initializeScore();
  }

  void _initializeScore() {
    final scoreNotifier = ref.read(taskScoreProvider.notifier);
    final frequencyId =
        widget.item.frequencyId == 0 ? 1 : widget.item.frequencyId;
    final frequencyName =
        getFrequencyName(frequencyId, widget.frequencyCache);
    final bucketDate = normalizeDate(frequencyId);

    currentScore = scoreNotifier.scoreForTask(
      widget.item.id,
      frequencyId,
      frequencyName,
      bucketDate,
    );
    sliderValue = (currentScore + 1).clamp(0, 3).toDouble();
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

  /// Check if the period (day/week/month) has passed
  /// For daily: checks if today has passed
  /// For weekly: checks if the week has passed
  /// For monthly: checks if the month has passed
  bool _isPeriodPassed(int frequencyId, DateTime bucketDate) {
    // Normalize both dates using the same frequency logic
    final normalizedNow = normalizeDate(frequencyId);
    
    // Normalize the bucket date based on frequency
    final normalizedBucketDate = _normalizeDateByFrequency(frequencyId, bucketDate);
    
    // If current normalized date is after the bucket normalized date, the period has passed
    return normalizedNow.isAfter(normalizedBucketDate);
  }

  DateTime _normalizeDateByFrequency(int frequencyId, DateTime date) {
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

  @override
  Widget build(BuildContext context) {
    final scoreNotifier = ref.read(taskScoreProvider.notifier);
    final frequencyId =
        widget.item.frequencyId == 0 ? 1 : widget.item.frequencyId;
    final frequencyName =
        getFrequencyName(frequencyId, widget.frequencyCache);
    final bucketDate = normalizeDate(frequencyId);
    final isPeriodPassed = _isPeriodPassed(frequencyId, bucketDate);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Score ($frequencyName)',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                if (isPeriodPassed)
                  Text(
                    'Period passed - Only Late allowed',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
            Text(
              _getScoreLabel(currentScore),
              style: TextStyle(
                color: _getColor(currentScore),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: _getColor(currentScore),
            thumbColor: _getColor(currentScore),
            inactiveTrackColor: _getColor(currentScore).withOpacity(0.3),
            trackHeight: 6,
          ),
          child: Slider(
            min: 0,
            max: 3,
            divisions: 3,
            value: sliderValue,
            onChanged: (v) async {
              int newScore = v.toInt() - 1;

              // If period has passed, only allow score 0 (Late)
              if (isPeriodPassed && newScore > 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                        'Period has passed. Only "Late" score is allowed.'),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 2),
                  ),
                );
                return; // Don't update score
              }

              final scoreObj = TaskScoreIsar()
                ..taskId = widget.item.id
                ..userId = widget.item.userId
                ..frequencyId = frequencyId
                ..frequencyName = frequencyName
                ..createdAt = bucketDate
                ..date = bucketDate
                ..score = newScore
                ..uniqueKey =
                    '${widget.item.id}-${widget.item.userId}-$frequencyId-${bucketDate.toIso8601String()}';

              await scoreNotifier.updateTaskScore(scoreObj);

              setState(() {
                currentScore = newScore;
                sliderValue = (newScore + 1).clamp(0, 3).toDouble();
              });
            },
          ),
        ),
      ],
    );
  }
}
