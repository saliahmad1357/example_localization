import 'package:isar/isar.dart';

part 'taskIsar.g.dart';

@collection
class TaskIsar {
  Id id = Isar.autoIncrement;

  late int userId; // Should be >= 1 (actual user ID)
  late int frequencyId;

  late String titleEn;
  late String titleUr;
  late String titleAr;

  late String descriptionEn;
  late String descriptionUr;
  late String descriptionAr;

  late int hour;
  late int minute; // store TimeOfDay manually

  int? dayOfWeek; // for weekly (1 = Monday... 7 = Sunday)
  int? dayOfMonth; // for monthly (1-31)

  late DateTime startTime;
  late DateTime endTime;

  bool isActive = true;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  bool isSynced = false;
}