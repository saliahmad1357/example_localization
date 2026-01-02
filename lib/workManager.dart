import 'package:workmanager/workmanager.dart';

import 'services/isarService.dart';
import 'services/notificationService.dart';
import 'services/scheduleService.dart';

const String rescheduleTaskName = "reschedule_notifications";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Ensure Isar and NotificationService are initialized in background isolate
    await IsarService().db; // opens DB & seeds if necessary
    await NotificationService().init();

    final scheduler = SchedulerService();
    await scheduler.rescheduleAll();

    return Future.value(true);
  });
}
