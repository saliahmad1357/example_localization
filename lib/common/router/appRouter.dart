import 'package:example_localization/common/router/routesName.dart';
import 'package:example_localization/screens/navigationScreens/analyticScreen.dart';
import 'package:example_localization/screens/navigationScreens/taskScreen/screens/addTaskScreen.dart';
import 'package:example_localization/screens/profileScreen.dart';
import 'package:example_localization/screens/navigationScreens/taskScreen/taskScreen.dart';
import 'package:go_router/go_router.dart';

import '../../models/isar/taskIsar.dart';
import '../../screens/navigationScreens/homeScreen.dart';
import '../../screens/mainScreen.dart';
import '../../screens/notificationScreen.dart';
import '../../screens/navigationScreens/settingScreen.dart';
import '../../screens/splashScreen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
          builder: (context, state, child) {
            return MainScreen(
                child:
                    child); // Keeps AppBar and BottomNavigationBar persistent
          },
          routes: [
            GoRoute(
              path: homeRoute,
              builder: (context, state) => HomeScreen(),
            ),
            GoRoute(
              path: tasksRoute,
              builder: (context, state) => const TaskScreen(),
            ),
            GoRoute(
              path: profileRoute,
              builder: (context, state) => const ProfileScreen(),
            ),
            GoRoute(
              path: analyticRoute,
              builder: (context, state) => const AnalyticScreen(),
            ),
            GoRoute(
              path: settingsRoute,
              builder: (context, state) => const SettingScreen(),
            ),
          ]),
      // GoRoute(
      //   path: '/search',
      //   builder: (context, state) => const SearchScreen(),
      // ),
      GoRoute(
        path: notificationRoute,
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: addTaskRoute,
        builder: (context, state) {
          final task = state.extra as TaskIsar?;
          return AddTaskScreen(task: task);
        },
      ),
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}
