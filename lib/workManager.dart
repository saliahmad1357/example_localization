import 'package:workmanager/workmanager.dart';

import 'services/isarService.dart';
import 'services/notificationService.dart';
import 'services/scheduleService.dart';

const String rescheduleTaskName = "reschedule_notifications";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print("👷 WorkManager executing task: $task");
    try {
      // Ensure Isar and NotificationService are initialized in background isolate
      await IsarService().db;
      await NotificationService().init();

      final scheduler = SchedulerService();
      await scheduler.rescheduleAll();
      
      print("👷 WorkManager task completed successfully.");
      return Future.value(true);
    } catch (e) {
      print("❌ WorkManager task failed: $e");
      return Future.value(false);
    }
  });
}
