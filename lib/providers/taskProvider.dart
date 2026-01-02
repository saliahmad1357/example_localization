import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/isar/taskIsar.dart';
import '../services/isarService.dart';
import '../services/scheduleService.dart';

// Riverpod provider
final taskProvider = AsyncNotifierProvider<TaskNotifier, List<TaskIsar>>(() {
  return TaskNotifier();
});



class TaskNotifier extends AsyncNotifier<List<TaskIsar>> {

  @override
  Future<List<TaskIsar>> build() async {
    final isar = await ref.read(isarServiceProvider).db;

    // Live updates
    isar.taskIsars.watchLazy().listen((_) async {
      state = AsyncData(await isar.taskIsars.where().findAll());
    });

    return await isar.taskIsars.where().findAll();
  }

  int selectedTaskIndex = 0;

  /// taskId -> score (-1..2)
  final Map<int, int> taskScores = {};

  /// Returns score for a given task
  int scoreForTask(int taskId) => taskScores[taskId] ?? 0;

  /// Sets score for a given task
  void setScoreForTask(int taskId, int score) {
    taskScores[taskId] = score;
    state = state; // trigger rebuild
  }

  void setSelectedTaskIndex(int index) {
    selectedTaskIndex = index;
    state = state; // trigger rebuild
  }

  void goToNextTask() {
    if (selectedTaskIndex < (state.value?.length ?? 0) - 1) {
      selectedTaskIndex++;
    }
    state = state;
  }

  
  // ADD TASK + SCHEDULE NOTIFICATION
  Future<void> addTask(TaskIsar task) async {
    final isar = ref.read(isarServiceProvider);
    final scheduler = ref.read(schedulerServiceProvider);

    final id = await isar.addTask(task);
    task.id = id;

    await scheduler.scheduleTask(task);
  }

  // UPDATE TASK + RESCHEDULE
  Future<void> updateTask(TaskIsar task) async {
    final isar = ref.read(isarServiceProvider);
    final scheduler = ref.read(schedulerServiceProvider);

    await scheduler.cancelTask(task.id);
    await isar.updateTask(task);
    await scheduler.scheduleTask(task);
  }

  // DELETE TASK + CANCEL NOTIFICATION
  Future<void> deleteTask(int id) async {
    final isar = ref.read(isarServiceProvider);
    final scheduler = ref.read(schedulerServiceProvider);

    await scheduler.cancelTask(id);
    await isar.deleteTask(id);
  }
}
