import 'package:isar/isar.dart';

part 'taskScoreIsar.g.dart';

@collection
class TaskScoreIsar {
  Id id = Isar.autoIncrement;

  late int userId;      // Should be >= 1 (actual user ID)
  late int taskId;      // Should be >= 1 (actual task ID)
  late int frequencyId;
  late String frequencyName;

  late int score;
  late DateTime date;

   /// 🔥 UNIQUE COMPOSITE KEY
  @Index(unique: true, replace: true)
  late String uniqueKey;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  bool isSynced = false;
}
