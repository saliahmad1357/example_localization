import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/isar/taskScoreIsar.dart';
import '../services/isarService.dart';
// import 'taskProvider.dart';

final taskScoreProvider =
    AsyncNotifierProvider<TaskScoreNotifier, List<TaskScoreIsar>>(TaskScoreNotifier.new);

class TaskScoreNotifier extends AsyncNotifier<List<TaskScoreIsar>> {
  @override
  Future<List<TaskScoreIsar>> build() async {
    final isar = ref.read(isarServiceProvider);
    final db = await isar.db;

    final scores = await db.taskScoreIsars.where().findAll();

    db.taskScoreIsars.watchLazy().listen((_) async {
      final updated = await db.taskScoreIsars.where().findAll();
      state = AsyncData(updated);
    });

    return scores;
  }

  Future<void> addTaskScore(TaskScoreIsar score) async {
    final isar = await ref.read(isarServiceProvider);
    await isar.addTaskScore(score);
  }

  Future<void> updateTaskScore(TaskScoreIsar score) async {
    final isar = await ref.read(isarServiceProvider);
    await isar.updateTaskScore(score);
  }

  int scoreForTask(int taskId, int frequencyId, String requencyName, DateTime bucketDate) {
    final list = state.asData?.value ?? [];

    // If frequencyName is empty, return default 0
    if (requencyName.isEmpty) {
      return 0;
    }

    final match = list.where((e) =>
        e.taskId == taskId &&
        e.frequencyId == frequencyId &&
        e.frequencyName == requencyName &&
        e.createdAt == bucketDate);

    return match.isNotEmpty ? match.first.score : 0;
  }


  Future<void> deleteTaskScore(int id) async {
    final isar = await ref.read(isarServiceProvider);
    await isar.deleteTaskScore(id);
  }

  Future<List<TaskScoreIsar>> getUserScores(int userId) async {
    final isar = await ref.read(isarServiceProvider);
    return await isar.getUserScores(userId);
  }

  Future<List<TaskScoreIsar>> getScoresByFrequency(int frequencyId) async {
    final isar = await ref.read(isarServiceProvider);
    return await isar.getScoresByFrequency(frequencyId);
  }

  Future<List<TaskScoreIsar>> getScoresByDate(int userId, int frequencyId, DateTime date) async {
    final isar = await ref.read(isarServiceProvider);
    return await isar.getScoresByDate(userId, frequencyId, date);
  }

//   Future<void> autoFillMissingScores() async {
//   final isar = await ref.read(isarServiceProvider);
//   final db = await isar.db;
//   final tasks = await ref.read(taskProvider.future);

//   final existingScores = await db.taskScoreIsars.where().findAll();

//   final now = DateTime.now();
//   final List<TaskScoreIsar> inserts = [];

//   for (final task in tasks) {
//     final freqType = frequencyFromId(task.frequencyId);

//     // Find latest score for this task
//     final taskScores = existingScores
//         .where((s) => s.taskId == task.id)
//         .toList()
//       ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

//     DateTime cursor;

//     if (taskScores.isEmpty) {
//       cursor = bucketStart(freqType, task.createdAt);
//     } else {
//       cursor = nextBucket(freqType, taskScores.last.createdAt);
//     }

//     final currentBucket = bucketStart(freqType, now);

//     while (cursor.isBefore(currentBucket)) {
//       final exists = taskScores.any(
//         (s) => bucketStart(freqType, s.createdAt) == cursor,
//       );

//       if (!exists) {
//         inserts.add(
//           TaskScoreIsar()
//             ..taskId = task.id
//             ..userId = task.userId
//             ..frequencyId = task.frequencyId
//             ..frequencyName = task.frequencyName
//             ..createdAt = cursor
//             ..score = -1
//             ..uniqueKey =
//                 '${task.id}-${task.userId}-${task.frequencyId}-${cursor.toIso8601String()}',
//         );
//       }

//       cursor = nextBucket(freqType, cursor);
//     }
//   }

//   if (inserts.isNotEmpty) {
//     await db.writeTxn(() async {
//       await db.taskScoreIsars.putAll(inserts);
//     });
//   }
// }

}
