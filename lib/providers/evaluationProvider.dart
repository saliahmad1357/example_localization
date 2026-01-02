import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/isar/evaluationIsar.dart';
import '../services/isarService.dart';

class EvaluationNotifier extends AsyncNotifier<List<EvaluationIsar>> {
  @override
  Future<List<EvaluationIsar>> build() async {
    final isar = ref.read(isarServiceProvider);
    final db = await isar.db;

    final frequencies = await db.evaluationIsars.where().findAll();

    db.evaluationIsars.watchLazy().listen((_) async {
      final updated = await db.evaluationIsars.where().findAll();
      state = AsyncData(updated);
    });

    return frequencies;
  }

  Future<void> addEvaluation(EvaluationIsar freq) async {
    final isar = ref.read(isarServiceProvider);
    await isar.addEvaluation(freq);
  }

  Future<void> updateEvaluation(EvaluationIsar freq) async {
    final isar = ref.read(isarServiceProvider);
    await isar.updateEvaluation(freq);
  }

  Future<void> deleteEvaluation(int id) async {
    final isar = ref.read(isarServiceProvider);
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
  AsyncNotifierProvider<EvaluationNotifier, List<EvaluationIsar>>(() {
    return EvaluationNotifier();
});
