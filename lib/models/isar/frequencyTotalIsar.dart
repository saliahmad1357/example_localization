import 'package:isar/isar.dart';

part 'frequencyTotalIsar.g.dart';

@collection
class FrequencyTotalIsar {
  Id id = Isar.autoIncrement;

  late int userId;
  late int frequencyId;
  late String frequencyName;

  late DateTime date;
  late String periodLabel;

  late int totalScore;
  late int totalTasks;
  late int maxPossibleScore;
  late double percentage;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  bool isSynced = false;
}
