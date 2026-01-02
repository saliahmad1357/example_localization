import 'package:example_localization/services/scheduleService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../common/frequencyBucketDate.dart';
import '../models/isar/evaluationIsar.dart';
import '../models/isar/frequencyIsar.dart';
import '../models/isar/frequencyTotalIsar.dart';
import '../models/isar/taskIsar.dart';
import '../models/isar/taskScoreIsar.dart';
import '../models/isar/userIsar.dart';

final isarServiceProvider = Provider<IsarService>((ref) {
  return IsarService();
});

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    final isar = Isar.instanceNames.isEmpty
        ? await Isar.open(
            [
              UserIsarSchema,
              FrequencyIsarSchema,
              TaskIsarSchema,
              TaskScoreIsarSchema,
              FrequencyTotalIsarSchema,
              EvaluationIsarSchema,
            ],
            directory: dir.path,
          )
        : Isar.getInstance()!;

    // Seed default user and frequencies
    await _seedDefaultUser(isar);
    await _seedFrequencyData(isar);
    await _seedDefaultTasks(isar);
    await _seedDefaultEvaluations(isar);
    // await ensureMissingScoresFilled();

    return isar;
  }

  // -----------------------------
  // USER METHODS
  // -----------------------------
  Future<int> addUser(UserIsar user) async {
    final isar = await db;
    return await isar.writeTxn(() async => await isar.userIsars.put(user));
  }

  Future<UserIsar?> getUserById(int id) async {
    final isar = await db;
    return await isar.userIsars.get(id);
  }

  Future<UserIsar?> getUserByEmail(String email) async {
    final isar = await db;
    return await isar.userIsars.filter().userEmailEqualTo(email).findFirst();
  }

  // -----------------------------
  // FREQUENCY METHODS
  // -----------------------------
  Future<int> addFrequency(FrequencyIsar freq) async {
    final isar = await db;
    return await isar.writeTxn(() async => await isar.frequencyIsars.put(freq));
  }

  Future<void> updateFrequency(FrequencyIsar freq) async {
    final isar = await db;
    final existing = await isar.frequencyIsars.get(freq.id);
    if (existing == null) {
      throw Exception("Frequency with id ${freq.id} does not exist");
    }

    await isar.writeTxn(() async {
      await isar.frequencyIsars.put(freq);
    });
  }

  Future<List<FrequencyIsar>> getFrequenciesByUser(int userId) async {
    final isar = await db;
    return await isar.frequencyIsars.filter().userIdEqualTo(userId).findAll();
  }

  Future<FrequencyIsar?> getFrequencyById(int id) async {
    final isar = await db;
    return await isar.frequencyIsars.get(id);
  }

  // -----------------------------
  // TASK METHODS
  // -----------------------------
  Future<int> addTask(TaskIsar task) async {
    final isar = await db;
    return await isar.writeTxn(() async => await isar.taskIsars.put(task));
  }

  Future<void> updateTask(TaskIsar task) async {
    final isar = await db;
    final existing = await isar.taskIsars.get(task.id);
    if (existing == null) {
      throw Exception("Task with id ${task.id} does not exist");
    }

    await isar.writeTxn(() async {
      await isar.taskIsars.put(task);
    });
  }

  Future<List<TaskIsar>> getTasksByUser(int userId) async {
    final isar = await db;
    return await isar.taskIsars.filter().userIdEqualTo(userId).findAll();
  }

  Future<List<TaskIsar>> getTasksByFrequency(int freqId) async {
    final isar = await db;
    return await isar.taskIsars.filter().frequencyIdEqualTo(freqId).findAll();
  }

  Future<List<TaskIsar>> getTasksByDate(int userId, DateTime date) async {
    final isar = await db;
    return await isar.taskIsars
        .filter()
        .userIdEqualTo(userId)
        .and()
        .createdAtEqualTo(date)
        .findAll();
  }

  Future<void> deleteTask(int id) async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.taskIsars.delete(id));
  }

  // -----------------------------
  // TASK SCORE METHODS
  // -----------------------------
  Future<int> addTaskScore(TaskScoreIsar score) async {
    final isar = await db;
    return await isar
        .writeTxn(() async => await isar.taskScoreIsars.put(score));
  }

  Future<int> updateTaskScore(TaskScoreIsar score) async {
    final isar = await db;
    return await isar
        .writeTxn(() async => await isar.taskScoreIsars.put(score));
  }

  Future<void> deleteTaskScore(int id) async {
    final isar = await db;
    return await isar
        .writeTxn(() async => await isar.taskScoreIsars.delete(id));
  }

  Future<List<TaskScoreIsar>> getScoresByTask(int taskId) async {
    final isar = await db;
    return await isar.taskScoreIsars.filter().taskIdEqualTo(taskId).findAll();
  }

  Future<List<TaskScoreIsar>> getUserScores(int userId) async {
    final isar = await db;
    return await isar.taskScoreIsars.filter().userIdEqualTo(userId).findAll();
  }

  Future<List<TaskScoreIsar>> getScoresByFrequency(int frequencyId) async {
    final isar = await db;
    return await isar.taskScoreIsars
        .filter()
        .frequencyIdEqualTo(frequencyId)
        .findAll();
  }

  Future<List<TaskScoreIsar>> getScoresByDate(
      int userId, int frequencyId, DateTime date) async {
    final isar = await db;
    return await isar.taskScoreIsars
        .filter()
        .userIdEqualTo(userId)
        .and()
        .frequencyIdEqualTo(frequencyId)
        .and()
        .dateEqualTo(date)
        .findAll();
  }

  // -----------------------------
  // EVALUATION METHODS
  // -----------------------------

  Future<int> addEvaluation(EvaluationIsar eval) async {
    final isar = await db;
    return await isar
        .writeTxn(() async => await isar.evaluationIsars.put(eval));
  }

  Future<void> updateEvaluation(EvaluationIsar eval) async {
    final isar = await db;
    final existing = await isar.evaluationIsars.get(eval.id);
    if (existing == null) {
      throw Exception("Evaluation with id ${eval.id} does not exist");
    }

    await isar.writeTxn(() async {
      await isar.evaluationIsars.put(eval);
    });
  }

  Future<List<EvaluationIsar>> getEvaluationsByUser(int userId) async {
    final isar = await db;
    return await isar.evaluationIsars.filter().userIdEqualTo(userId).findAll();
  }

  Future<EvaluationIsar?> getEvaluationById(int id) async {
    final isar = await db;
    return await isar.evaluationIsars.get(id);
  }

  Future<bool> deleteEvaluation(int id) async {
    final isar = await db;
    return await isar.evaluationIsars.delete(id);
  }

  // -----------------------------
  // FREQUENCY TOTAL METHODS
  // -----------------------------
  Future<int> addFrequencyTotal(FrequencyTotalIsar total) async {
    final isar = await db;
    return await isar
        .writeTxn(() async => await isar.frequencyTotalIsars.put(total));
  }

  Future<void> deleteFrequencyTotal(int id) async {
    final isar = await db;
    return await isar
        .writeTxn(() async => await isar.frequencyTotalIsars.delete(id));
  }

  Future<List<FrequencyTotalIsar>> getTotals(int userId, DateTime date) async {
    final isar = await db;
    return await isar.frequencyTotalIsars
        .filter()
        .userIdEqualTo(userId)
        .and()
        .dateEqualTo(date)
        .findAll();
  }

  Future<void> ensureMissingScoresFilled() async {
    final isar = await db;

    final tasks = await isar.taskIsars.where().findAll();
    final existingScores = await isar.taskScoreIsars.where().findAll();
    final frequencies = await isar.frequencyIsars.where().findAll();

    String getFrequencyNameById(
      int frequencyId,
      List<FrequencyIsar> frequencies,
    ) {
      return frequencies
          .firstWhere((f) => f.id == frequencyId)
          .name
          .toLowerCase();
    }

    final now = DateTime.now();
    final List<TaskScoreIsar> toInsert = [];

    for (final task in tasks) {
      final frequencyType = getFrequencyNameById(task.frequencyId, frequencies);

      // group existing scores for this task+frequency
      final taskScores = existingScores.where(
          (s) => s.taskId == task.id && s.frequencyId == task.frequencyId);

      // find last recorded bucket
      DateTime? lastBucket;
      if (taskScores.isNotEmpty) {
        lastBucket = taskScores
            .map((s) => s.createdAt)
            .reduce((a, b) => a.isAfter(b) ? a : b);
      }

      // if never scored, start from task startTime
      DateTime cursor = lastBucket ??
          FrequencyBucket.bucketStart(
            frequencyType,
            task.startTime,
          );

      // move to next bucket
      cursor = FrequencyBucket.nextBucket(frequencyType, cursor);

      // stop BEFORE current bucket
      final currentBucket = FrequencyBucket.bucketStart(frequencyType, now);

      while (cursor.isBefore(currentBucket)) {
        final exists = taskScores.any(
          (s) => s.createdAt == cursor,
        );

        if (!exists) {
          toInsert.add(
            TaskScoreIsar()
              ..taskId = task.id
              ..userId = task.userId
              ..frequencyId = task.frequencyId
              ..frequencyName = '' // optional cache
              ..createdAt = cursor
              ..date = cursor
              ..score = -1
              ..uniqueKey =
                  '${task.id}-${task.userId}-${task.frequencyId}-${cursor.toIso8601String()}',
          );
        }

        cursor = FrequencyBucket.nextBucket(frequencyType, cursor);
      }
    }

    if (toInsert.isNotEmpty) {
      await isar.writeTxn(() async {
        await isar.taskScoreIsars.putAll(toInsert);
      });
      print (
          '✅ Filled ${toInsert.length} missing task scores for existing tasks.');
    }
  }

// -----------------------------
// SEED DEFAULT TASKS
// -----------------------------
  Future<void> _seedDefaultTasks(Isar isar) async {
    final taskCount = await isar.taskIsars.count();
    if (taskCount > 0) {
      print('🟢 Default tasks already exist.');
      return;
    }

    print('🌱 Seeding default tasks...');
    final now = DateTime.now();

    // Karachi prayer-based times (24h format)
    final fajr = DateTime(now.year, now.month, now.day, 5, 15);
    final dohr = DateTime(now.year, now.month, now.day, 12, 45);
    final asr = DateTime(now.year, now.month, now.day, 16, 15);
    final maghrib = DateTime(now.year, now.month, now.day, 17, 55);
    final isha = DateTime(now.year, now.month, now.day, 19, 45);
    final other = DateTime(now.year, now.month, now.day, 16, 00);

    final List<TaskIsar> defaultTasks = [
      // ---------- DAILY TASKS ----------
      TaskIsar()
        ..userId = 1
        ..frequencyId = 1
        ..titleEn = 'Fajr Prayer'
        ..titleUr = 'فجر کی نماز'
        ..titleAr = 'صلاة الفجر'
        ..descriptionEn = 'Perform the early morning prayer before sunrise.'
        ..descriptionUr = 'طلوعِ آفتاب سے پہلے صبح کی نماز ادا کریں۔'
        ..descriptionAr = 'أَدِّ صلاة الفجر قبل شروق الشمس.'
        ..hour = fajr.hour
        ..minute = fajr.minute
        ..startTime = fajr
        ..endTime = fajr.add(const Duration(minutes: 30))
        ..createdAt = now
        ..updatedAt = now,

      TaskIsar()
        ..userId = 1
        ..frequencyId = 1
        ..titleEn = 'Dohr Prayer'
        ..titleUr = 'ظہر کی نماز'
        ..titleAr = 'صلاة الظهر'
        ..descriptionEn =
            'Offer the midday prayer after the sun passes its zenith.'
        ..descriptionUr = 'سورج کے زوال کے بعد دوپہر کی نماز ادا کریں۔'
        ..descriptionAr = 'أَدِّ صلاة الظهر بعد زوال الشمس.'
        ..hour = dohr.hour
        ..minute = dohr.minute
        ..startTime = dohr
        ..endTime = dohr.add(const Duration(minutes: 30))
        ..createdAt = now
        ..updatedAt = now,

      TaskIsar()
        ..userId = 1
        ..frequencyId = 1
        ..titleEn = 'Asr Prayer'
        ..titleUr = 'عصر کی نماز'
        ..titleAr = 'صلاة العصر'
        ..descriptionEn = 'Perform the afternoon prayer before sunset.'
        ..descriptionUr = 'غروبِ آفتاب سے پہلے شام کی نماز ادا کریں۔'
        ..descriptionAr = 'أَدِّ صلاة العصر قبل غروب الشمس.'
        ..hour = asr.hour
        ..minute = asr.minute
        ..startTime = asr
        ..endTime = asr.add(const Duration(minutes: 30))
        ..createdAt = now
        ..updatedAt = now,

      TaskIsar()
        ..userId = 1
        ..frequencyId = 1
        ..titleEn = 'Maghrib Prayer'
        ..titleUr = 'مغرب کی نماز'
        ..titleAr = 'صلاة المغرب'
        ..descriptionEn = 'Offer the evening prayer just after sunset.'
        ..descriptionUr = 'سورج غروب ہونے کے فوراً بعد نماز ادا کریں۔'
        ..descriptionAr = 'أَدِّ صلاة المغرب بعد غروب الشمس مباشرةً.'
        ..hour = maghrib.hour
        ..minute = maghrib.minute
        ..startTime = maghrib
        ..endTime = maghrib.add(const Duration(minutes: 30))
        ..createdAt = now
        ..updatedAt = now,

      TaskIsar()
        ..userId = 1
        ..frequencyId = 1
        ..titleEn = 'Isha Prayer'
        ..titleUr = 'عشاء کی نماز'
        ..titleAr = 'صلاة العشاء'
        ..descriptionEn = 'Perform the night prayer after twilight disappears.'
        ..descriptionUr = 'شفق کے ختم ہونے کے بعد رات کی نماز ادا کریں۔'
        ..descriptionAr = 'أَدِّ صلاة العشاء بعد اختفاء الشفق.'
        ..hour = isha.hour
        ..minute = isha.minute
        ..startTime = isha
        ..endTime = isha.add(const Duration(minutes: 30))
        ..createdAt = now
        ..updatedAt = now,

      TaskIsar()
        ..userId = 1
        ..frequencyId = 1
        ..titleEn = 'Quran Half Juz Recitation'
        ..titleUr = 'قرآن آدھا پارہ تلاوت'
        ..titleAr = 'تلاوة نصف جزء من القرآن'
        ..descriptionEn = 'Recite half a Juz (Para) of the Holy Quran daily.'
        ..descriptionUr = 'روزانہ قرآنِ مجید کا آدھا پارہ تلاوت کریں۔'
        ..descriptionAr = 'اقرأ نصف جزء من القرآن الكريم يوميًا.'
        ..hour = other.hour
        ..minute = other.minute
        ..startTime = other
        ..endTime = other.add(const Duration(minutes: 30))
        ..createdAt = now
        ..updatedAt = now,

      TaskIsar()
        ..userId = 1
        ..frequencyId = 1
        ..titleEn = 'Tasbihat'
        ..titleUr = 'تسبیحات'
        ..titleAr = 'الأذكار'
        ..descriptionEn = 'Remember Allah through daily tasbeeh and dhikr.'
        ..descriptionUr = 'روزانہ ذکر و تسبیح کے ذریعے اللہ کو یاد کریں۔'
        ..descriptionAr = 'اذكر الله يوميًا بالتسبيح والذكر.'
        ..hour = other.hour
        ..minute = other.minute
        ..startTime = other
        ..endTime = other.add(const Duration(minutes: 30))
        ..createdAt = now
        ..updatedAt = now,

      TaskIsar()
        ..userId = 1
        ..frequencyId = 1
        ..titleEn = 'Daily Sadqa'
        ..titleUr = 'روزانہ صدقہ'
        ..titleAr = 'الصدقة اليومية'
        ..descriptionEn = 'Give charity daily even if it’s a small amount.'
        ..descriptionUr = 'روزانہ صدقہ دیں چاہے تھوڑی سی رقم ہی کیوں نہ ہو۔'
        ..descriptionAr = 'تصدَّق كل يوم ولو بمقدارٍ قليل.'
        ..hour = other.hour
        ..minute = other.minute
        ..startTime = other
        ..endTime = other.add(const Duration(minutes: 30))
        ..createdAt = now
        ..updatedAt = now,

      // ---------- WEEKLY TASKS ----------
      TaskIsar()
        ..userId = 1
        ..frequencyId = 2
        ..titleEn = 'Recite Surah Kahf'
        ..titleUr = 'سورۃ الکہف کی تلاوت'
        ..titleAr = 'تلاوة سورة الكهف'
        ..descriptionEn =
            'Recite Surah Al-Kahf every Friday for blessings and protection.'
        ..descriptionUr =
            'ہر جمعہ کو سورۃ الکہف کی تلاوت کریں تاکہ برکت اور حفاظت حاصل ہو۔'
        ..descriptionAr = 'اقرأ سورة الكهف كل يوم جمعة للبركة والحماية.'
        ..hour = other.hour
        ..minute = other.minute
        ..dayOfWeek = 5 // Friday
        ..startTime = other
        ..endTime = other.add(const Duration(minutes: 30))
        ..createdAt = now
        ..updatedAt = now,

      TaskIsar()
        ..userId = 1
        ..frequencyId = 2
        ..titleEn = 'One Hour for Dua'
        ..titleUr = 'ایک گھنٹہ دعا کے لیے'
        ..titleAr = 'ساعة للدعاء'
        ..descriptionEn =
            'Dedicate one hour weekly to make heartfelt dua and reflection.'
        ..descriptionUr =
            'ہر ہفتے ایک گھنٹہ خلوصِ دل سے دعا اور غور و فکر کے لیے مخصوص کریں۔'
        ..descriptionAr = 'خصص ساعة أسبوعيًا للدعاء الصادق والتأمل.'
        ..hour = other.hour
        ..minute = other.minute
        ..dayOfWeek = 7 // Sunday
        ..startTime = other
        ..endTime = other.add(const Duration(minutes: 60))
        ..createdAt = now
        ..updatedAt = now,

      // ---------- MONTHLY TASK ----------
      TaskIsar()
        ..userId = 1
        ..frequencyId = 3
        ..titleEn = 'Invest 10k'
        ..titleUr = '10 ہزار کی سرمایہ کاری'
        ..titleAr = 'استثمار ١٠٠٠٠'
        ..descriptionEn =
            'Invest 10,000 wisely to grow your wealth in a halal way.'
        ..descriptionUr =
            'اپنے مال کو بڑھانے کے لیے 10 ہزار روپے حلال طریقے سے سرمایہ کاری کریں۔'
        ..descriptionAr = 'استثمر عشرة آلاف بطريقة حلال لتنمية مالك.'
        ..hour = other.hour
        ..minute = other.minute
        ..dayOfMonth = 30
        ..startTime = other
        ..endTime = other.add(const Duration(minutes: 30))
        ..createdAt = now
        ..updatedAt = now,
    ];

    await isar.writeTxn(() async {
      await isar.taskIsars.putAll(defaultTasks);
    });

    // Schedule all seeded tasks
    final scheduler = SchedulerService();
    for (final task in defaultTasks) {
      await scheduler.scheduleTask(task);
    }

    print('✅ Default tasks seeded successfully.');
  }

  // -----------------------------
  // SEED DEFAULT USER
  // -----------------------------
  Future<void> _seedDefaultUser(Isar isar) async {
    final userCount = await isar.userIsars.count();
    if (userCount > 0) {
      print('🟢 Default user already exists.');
      return;
    }

    print('🌱 Creating default user...');
    final defaultUser = UserIsar()
      ..userName = 'Default User'
      ..userEmail = 'default@example.com'
      ..userPhoneNo = '0300 0000000'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..isSynced = false;

    await isar.writeTxn(() async {
      await isar.userIsars.put(defaultUser);
    });

    print('✅ Default user created successfully.');
  }

  // -----------------------------
  // SEED DEFAULT FREQUENCIES
  // -----------------------------
  Future<void> _seedFrequencyData(Isar isar) async {
    final count = await isar.frequencyIsars.count();
    if (count > 0) {
      print('🟢 Frequency data already exists.');
      return;
    }

    print('🌱 Seeding default Frequency data...');
    final now = DateTime.now();

    final daily = FrequencyIsar()
      ..userId = 1
      ..name = 'Daily'
      ..sound = 'assets/sounds/daily_sound'
      ..createdAt = now
      ..updatedAt = now;

    final weekly = FrequencyIsar()
      ..userId = 1
      ..name = 'Weekly'
      ..sound = 'assets/sounds/weekly_sound'
      ..createdAt = now
      ..updatedAt = now;

    final monthly = FrequencyIsar()
      ..userId = 1
      ..name = 'Monthly'
      ..sound = 'assets/sounds/monthly_sound'
      ..createdAt = now
      ..updatedAt = now;

    await isar.writeTxn(() async {
      await isar.frequencyIsars.putAll([daily, weekly, monthly]);
    });

    print('✅ Default Frequency data created.');
  }

  // -----------------------------
  // SEED DEFAULT EVALUATIONS
  // -----------------------------
  Future<void> _seedDefaultEvaluations(Isar isar) async {
    final evaluationCount = await isar.evaluationIsars.count();
    if (evaluationCount > 0) {
      print('🟢 Default evaluations already exist.');
      return;
    }

    print('🌱 Creating default evaluations...');
    final now = DateTime.now();

    final List<EvaluationIsar> defaultEvaluations = [
      EvaluationIsar()
        ..userId = 1
        ..name = 'Daily'
        ..sound = 'assets/sounds/daily_sound.mp3'
        ..hour = 8
        ..minute = 0
        ..createdAt = now
        ..updatedAt = now
        ..isSynced = false,
      EvaluationIsar()
        ..userId = 1
        ..name = 'Weekly'
        ..sound = 'assets/sounds/weekly_sound.mp3'
        ..dayOfWeek = 5 // Friday
        ..hour = 18
        ..minute = 0
        ..createdAt = now
        ..updatedAt = now
        ..isSynced = false,
      EvaluationIsar()
        ..userId = 1
        ..name = 'Monthly'
        ..sound = 'assets/sounds/monthly_sound.mp3'
        ..dayOfMonth = 1
        ..hour = 9
        ..minute = 0
        ..createdAt = now
        ..updatedAt = now
        ..isSynced = false,
    ];

    await isar.writeTxn(() async {
      await isar.evaluationIsars.putAll(defaultEvaluations);
    });

// Schedule all seeded Evaluations
    final scheduler = SchedulerService();
    for (final eval in defaultEvaluations) {
      await scheduler.scheduleEvaluation(eval);
    }
    print('✅ Default evaluations created successfully.');
  }

  // -----------------------------
  // UTILITY / MAINTENANCE
  // -----------------------------
  Future<void> clearAll() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}
