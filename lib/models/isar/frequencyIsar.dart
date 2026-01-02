import 'package:isar/isar.dart';

part 'frequencyIsar.g.dart';

@collection
class FrequencyIsar {
  Id id = Isar.autoIncrement;

  late int userId;
  late String name; // daily, weekly, monthly
  late String sound;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  bool isSynced = false;
}
