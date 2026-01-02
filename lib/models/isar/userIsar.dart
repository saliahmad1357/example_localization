import 'package:isar/isar.dart';

import 'evaluationIsar.dart';

part 'userIsar.g.dart';

@collection
class UserIsar {
  Id id = Isar.autoIncrement;

  late String userName;
  late String userEmail;
  late String userPhoneNo;

  final evaluationTimes = IsarLinks<EvaluationIsar>();

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  bool isSynced = false; // for future premium sync
}
