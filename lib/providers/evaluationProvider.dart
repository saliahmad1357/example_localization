import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/isar/evaluationIsar.dart';
import '../services/isarService.dart';
import '../services/scheduleService.dart';

class EvaluationNotifier extends AsyncNotifier<List<EvaluationIsar>> {
  @override
  Future<List<EvaluationIsar>> build() async {
    final isar = ref.read(isarServiceProvider);
    final db = await isar.db;

    final evaluations = await db.evaluationIsars.where().findAll();

    db.evaluationIsars.watchLazy().listen((_) async {
      final updated = await db.evaluationIsars.where().findAll();
      state = AsyncData(updated);
    });

    return evaluations;
  }

  Future<void> addEvaluation(EvaluationIsar eval) async {
    final isar = ref.read(isarServiceProvider);
    final scheduler = ref.read(schedulerServiceProvider);
    
    final id = await isar.addEvaluation(eval);
    eval.id = id;
    
    await scheduler.scheduleEvaluation(eval);
  }

  Future<void> updateEvaluation(EvaluationIsar eval) async {
    final isar = ref.read(isarServiceProvider);
    final scheduler = ref.read(schedulerServiceProvider);
    
    // Cancel old and schedule new
    await scheduler.cancelEvaluation(eval.id);
    await isar.updateEvaluation(eval);
    await scheduler.scheduleEvaluation(eval);
    
    print("🔔 Evaluation updated and rescheduled: ID=${eval.id}");
  }

  Future<void> deleteEvaluation(int id) async {
    final isar = ref.read(isarServiceProvider);
    final scheduler = ref.read(schedulerServiceProvider);
    
    await scheduler.cancelEvaluation(id);
    await isar.deleteEvaluation(id);
  }

  Future<EvaluationIsar?> getEvaluationById(int id) async {
    final isar = ref.read(isarServiceProvider);
    return await isar.getEvaluationById(id);
  }

  Future<List<EvaluationIsar>> getEvaluationsByUser(int userId) async {
    final isar = ref.read(isarServiceProvider);
    return await isar.getEvaluationsByUser(userId);
  }
}

final evaluationProvider =
    AsyncNotifierProvider<EvaluationNotifier, List<EvaluationIsar>>(
        EvaluationNotifier.new);
