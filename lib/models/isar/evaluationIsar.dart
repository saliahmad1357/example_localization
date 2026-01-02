import 'package:isar/isar.dart';

import 'userIsar.dart';

part 'evaluationIsar.g.dart';

@collection
class EvaluationIsar {
  Id id = Isar.autoIncrement;

  late int userId;

  late String name; // daily, weekly, monthly
  late String sound;

  
  late int hour;
  late int minute; // store TimeOfDay manually

  int? dayOfWeek; // for weekly (1 = Monday... 7 = Sunday)
  int? dayOfMonth; // for monthly (1-31)


  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  final user = IsarLink<UserIsar>();
  bool isSynced = false;
}
