import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:example_localization/common/router/routesName.dart';
import 'package:example_localization/providers/evaluationProvider.dart';
import 'package:example_localization/services/notificationService.dart';
import '../main.dart';
import 'dart:async';

class MainScreen extends ConsumerStatefulWidget {
  final Widget child;
  const MainScreen({super.key, required this.child}); // ✅ fixed here

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  StreamSubscription? _notifSubscription;

  @override
  void initState() {
    super.initState();
    _listenToNotifications();
  }

  @override
  void dispose() {
    _notifSubscription?.cancel();
    super.dispose();
  }

  void _listenToNotifications() {
    _notifSubscription = NotificationService().notificationStream.listen((payload) async {
      print("🎯 MainScreen handling notification: $payload");
      if (payload.startsWith('eval_')) {
        final idStr = payload.replaceFirst('eval_', '');
        final id = int.tryParse(idStr);
        if (id != null) {
          final evaluations = await ref.read(evaluationProvider.future);
          final eval = evaluations.firstWhere((e) => e.id == id);
          if (mounted) {
            context.push(performEvaluationRoute, extra: eval);
          }
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // ✅ Watch locale changes so UI rebuilds automatically
    ref.watch(localeProvider);

    final tabs = [
      {'path': '/home', 'icon': Icons.home, 'label': tr('homeTitle')},
      {'path': '/tasks', 'icon': Icons.task, 'label': tr('taskTitle')},
      {
        'path': '/analytic',
        'icon': Icons.analytics,
        'label': tr('analyticTitle')
      },
      {
        'path': '/settings',
        'icon': Icons.settings,
        'label': tr('settingsTitle')
      },
    ];

    // ✅ Identify the current active tab from route
    int currentIndex = tabs.indexWhere(
      (tab) => GoRouterState.of(context).uri.path == tab['path'],
    );
    if (currentIndex == -1) currentIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('logoText')),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              context.push('/profile');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              context.push('/notification');
            },
          ),
        ],
      ),

      // ✅ Display the active ShellRoute child
      body: widget.child,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) => context.go(tabs[index]['path'] as String),
        items: tabs
            .map(
              (tab) => BottomNavigationBarItem(
                icon: Icon(tab['icon'] as IconData),
                label: tab['label'] as String,
              ),
            )
            .toList(),
      ),
    );
  }
}
