import 'package:example_localization/common/router/appRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:workmanager/workmanager.dart';

import 'common/theme/appTheme.dart';
import 'services/isarService.dart';
import 'services/notificationService.dart';
import 'services/scheduleService.dart';
import 'workManager.dart';

final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));
final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

// === Initialize Isar (DB) ===

  // === Initialize Notification Service ===

  final notif = NotificationService();
  await notif.init();
  // Don't await permission request in main, it will show a dialog on top of the splash screen
  notif.requestPermission();

  final isarService = IsarService();
  await isarService.db;

  // === Initialize WorkManager ===
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false,
  );

  // === Register periodic background rescheduler ===
  Workmanager().registerPeriodicTask(
    "reschedule_periodic",
    rescheduleTaskName,
    frequency: const Duration(hours: 6),
    initialDelay: const Duration(seconds: 10),
    constraints: Constraints(
      networkType: NetworkType.not_required,
    ),
  );

  // === Run maintenance and rescheduling in background without blocking runApp ===
  final scheduler = SchedulerService();
  Future.microtask(() async {
    await scheduler.rescheduleAll();
    await isarService.ensureMissingScoresFilled();
  });

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('es'),
        Locale('ur'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ Use EasyLocalization's locale directly instead of Riverpod's internal one
    final locale = context.locale;
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: AppRouter.router,
    );
  }
}
