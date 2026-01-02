import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/isar/frequencyTotalIsar.dart';
import '../services/isarService.dart';

final frequencyTotalProvider =
    AsyncNotifierProvider<FrequencyTotalNotifier, List<FrequencyTotalIsar>>(FrequencyTotalNotifier.new);

class FrequencyTotalNotifier extends AsyncNotifier<List<FrequencyTotalIsar>> {
  @override
  Future<List<FrequencyTotalIsar>> build() async {
    final isar = ref.read(isarServiceProvider);
    final db = await isar.db;

    final totals = await db.frequencyTotalIsars.where().findAll();

    db.frequencyTotalIsars.watchLazy().listen((_) async {
      final updated = await db.frequencyTotalIsars.where().findAll();
      state = AsyncData(updated);
    });

    return totals;
  }

  Future<void> addFrequencyTotal(FrequencyTotalIsar total) async {
    final isar = await ref.read(isarServiceProvider);
    await isar.addFrequencyTotal(total);
  }

  Future<void> deleteFrequencyTotal(int id) async {
    final isar = await ref.read(isarServiceProvider);
    await isar.deleteFrequencyTotal(id);
  } 

  Future<List<FrequencyTotalIsar>> getTotals(int userId,  DateTime date) async {
    final isar = await ref.read(isarServiceProvider);
    return await isar.getTotals(userId, date);
  }
}