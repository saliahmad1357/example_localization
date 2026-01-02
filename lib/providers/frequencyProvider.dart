import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/isar/frequencyIsar.dart';
import '../services/isarService.dart';

class FrequencyNotifier extends AsyncNotifier<List<FrequencyIsar>> {
  @override
  Future<List<FrequencyIsar>> build() async {
    final isar = ref.read(isarServiceProvider);
    final db = await isar.db;

    final frequencies = await db.frequencyIsars.where().findAll();

    db.frequencyIsars.watchLazy().listen((_) async {
      final updated = await db.frequencyIsars.where().findAll();
      state = AsyncData(updated);
    });

    return frequencies;
  }

  Future<void> addFrequency(FrequencyIsar freq) async {
    final isar = ref.read(isarServiceProvider);
    await isar.addFrequency(freq);
  }

  Future<void> updateFrequency(FrequencyIsar freq) async {
    final isar = ref.read(isarServiceProvider);
    await isar.updateFrequency(freq);
  }
  
  Future<FrequencyIsar?> getFrequencyById(int id) async {
    final isar = ref.read(isarServiceProvider);
    return await isar.getFrequencyById(id);
  }

  Future<List<FrequencyIsar>> getFrequenciesByUser(int userId) async {
    final isar = ref.read(isarServiceProvider);
    return await isar.getFrequenciesByUser(userId);
  }
}
final frequencyProvider =
  AsyncNotifierProvider<FrequencyNotifier, List<FrequencyIsar>>(() {
    return FrequencyNotifier();
});
