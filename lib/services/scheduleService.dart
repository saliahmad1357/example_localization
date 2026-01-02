import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../models/isar/taskIsar.dart';
import '../models/isar/evaluationIsar.dart';
import 'isarService.dart';
import 'notificationService.dart';

final schedulerServiceProvider = Provider<SchedulerService>((ref) {
  return SchedulerService();
});

class SchedulerService {
  final NotificationService _ns = NotificationService();

  // ---------------------------------------------------------
  // 🔊 SOUND HELPERS
  // ---------------------------------------------------------
  String _normalizeSound(String raw) {
    final file = raw.split('/').last;
    return file.split('.').first;
  }

  String _soundForEvaluation(EvaluationIsar eval) {
    return _normalizeSound(eval.sound);
  }

  String _soundForTask(TaskIsar task) {
    switch (task.frequencyId) {
      case 1:
        return "daily_sound";
      case 2:
        return "weekly_sound";
      case 3:
        return "monthly_sound";
      default:
        return "daily_sound";
    }
  }

  // ---------------------------------------------------------
  // 📅 DATE HELPERS
  // ---------------------------------------------------------
  DateTime _nextDaily(int hour, int minute) {
    final now = DateTime.now();
    var dt = DateTime(now.year, now.month, now.day, hour, minute);
    if (dt.isBefore(now)) dt = dt.add(const Duration(days: 1));
    return dt;
  }

  DateTime _nextWeekly(int weekday, int hour, int minute) {
    final now = DateTime.now();
    int diff = (weekday - now.weekday) % 7;

    if (diff == 0) {
      final candidate = DateTime(now.year, now.month, now.day, hour, minute);
      if (candidate.isBefore(now)) diff = 7;
    }

    final target = now.add(Duration(days: diff));
    return DateTime(target.year, target.month, target.day, hour, minute);
  }

  DateTime _nextMonthly(int day, int hour, int minute) {
    final now = DateTime.now();
    DateTime candidate;

    try {
      candidate = DateTime(now.year, now.month, day, hour, minute);
    } catch (_) {
      final end = DateTime(now.year, now.month + 1, 0);
      candidate = DateTime(end.year, end.month, end.day, hour, minute);
    }

    if (candidate.isBefore(now)) {
      candidate = DateTime(now.year, now.month + 1, day, hour, minute);
    }

    return candidate;
  }

  // ---------------------------------------------------------
  // 🟦 TASK SCHEDULING
  // ---------------------------------------------------------
  Future<void> scheduleTask(TaskIsar task) async {
    if (!task.isActive) return;

    await _ns.init();

    final sound = _soundForTask(task);
    DateTime scheduled;
    DateTimeComponents? repeat;

    if (task.dayOfWeek != null) {
      scheduled = _nextWeekly(task.dayOfWeek!, task.hour, task.minute);
      repeat = DateTimeComponents.dayOfWeekAndTime;
    } else if (task.dayOfMonth != null) {
      scheduled = _nextMonthly(task.dayOfMonth!, task.hour, task.minute);
      repeat = DateTimeComponents.dayOfMonthAndTime;
    } else {
      scheduled = _nextDaily(task.hour, task.minute);
      repeat = DateTimeComponents.time;
    }

    await _ns.schedule(
      id: task.id, // unique per task
      title: task.titleEn,
      body: task.descriptionEn,
      scheduledDateTime: scheduled,
      soundResourceName: sound,
      repeatComponents: repeat,
    );
  }

  // ---------------------------------------------------------
  // 🟩 EVALUATION SCHEDULING
  // ---------------------------------------------------------
  Future<void> scheduleEvaluation(EvaluationIsar eval) async {
    await _ns.init();

    final sound = _soundForEvaluation(eval);
    DateTime scheduled;
    DateTimeComponents? repeat;

    final type = eval.name.toLowerCase();

    if (type == "daily") {
      scheduled = _nextDaily(eval.hour, eval.minute);
      repeat = DateTimeComponents.time;
    } else if (type == "weekly" && eval.dayOfWeek != null) {
      scheduled = _nextWeekly(eval.dayOfWeek!, eval.hour, eval.minute);
      repeat = DateTimeComponents.dayOfWeekAndTime;
    } else if (type == "monthly" && eval.dayOfMonth != null) {
      scheduled = _nextMonthly(eval.dayOfMonth!, eval.hour, eval.minute);
      repeat = DateTimeComponents.dayOfMonthAndTime;
    } else {
      scheduled = _nextDaily(eval.hour, eval.minute);
      repeat = DateTimeComponents.time;
    }

    final id = 50000 + eval.id; // avoid conflicts with tasks

    await _ns.schedule(
      id: id,
      title: "${eval.name} Evaluation",
      body: "Time for your ${eval.name} evaluation",
      scheduledDateTime: scheduled,
      soundResourceName: sound,
      repeatComponents: repeat,
    );
  }

  // ---------------------------------------------------------
  // ❌ CANCEL METHODS (you asked for this)
  // ---------------------------------------------------------
  Future<void> cancelTask(int id) async {
  await _ns.init();
  await _ns.cancel(id);
}

Future<void> cancelEvaluation(int id) async {
  await _ns.init();
  await _ns.cancel(50000 + id);
}

  // ---------------------------------------------------------
  // 🔄 RESCHEDULE ALL (WorkManager uses this)
  // ---------------------------------------------------------
  Future<void> rescheduleAll() async {
    await _ns.init();

    final isar = await IsarService().db;

    final tasks = await isar.taskIsars
        .filter()
        .isActiveEqualTo(true)
        .findAll();

    final evals = await isar.evaluationIsars.where().findAll();

    for (final e in evals) {
      try {
        await scheduleEvaluation(e);
      } catch (_) {}
    }

    for (final t in tasks) {
      try {
        await scheduleTask(t);
      } catch (_) {}
    }
  }
}
