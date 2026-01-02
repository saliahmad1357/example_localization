import 'package:easy_localization/easy_localization.dart';
import 'package:example_localization/models/isar/taskIsar.dart';
import 'package:example_localization/models/isar/frequencyIsar.dart';
import 'package:example_localization/models/isar/evaluationIsar.dart';
import 'package:example_localization/providers/frequencyProvider.dart';
import 'package:example_localization/providers/evaluationProvider.dart';
import 'package:example_localization/providers/tabProvider.dart';
import 'package:example_localization/providers/taskProvider.dart';
import 'package:example_localization/screens/navigationScreens/taskScreen/tabs/taskTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


import '../../../common/router/routesName.dart';
import 'tabs/frequencyTab.dart';
import 'tabs/evaluationTab.dart';
import 'tabs/scoreTab.dart';
import 'tabsWidgets/tabBar.dart';
// import 'dialogs/addTaskDialog.dart';
import 'dialogs/addFrequencyDialog.dart';
import 'dialogs/addEvaluationDialog.dart';

class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({super.key});

  @override
  ConsumerState<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
  Map<int, String> frequencyCache = {};

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(tabProvider.notifier).setTab(0);
      _loadFrequencyCache();
    });
  }

  void _loadFrequencyCache() async {
    final frequencyAsync = ref.read(frequencyProvider);
    frequencyAsync.when(
      data: (frequenciesList) {
        setState(() {
          for (var freq in frequenciesList) {
            frequencyCache[freq.id] = freq.name;
          }
        });
        debugPrint('✓ Frequency cache loaded: $frequencyCache');
      },
      loading: () {},
      error: (_, __) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(tabProvider);
    final tasksAsync = ref.watch(taskProvider);
    final frequencyAsync = ref.watch(frequencyProvider);
    final evaluationAsync = ref.watch(evaluationProvider);

    final tasks = tasksAsync.asData?.value ?? [];
    final frequencies = frequencyAsync.asData?.value ?? [];
    
    final evaluations = evaluationAsync.asData?.value ?? [];

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 12),
          TabBarLocal(tabIndex: tabIndex),
          const SizedBox(height: 12),
          Text(tr('taskMessage'),
              style: Theme.of(context).textTheme.titleLarge),
          Expanded(
            child: _buildTabContent(
              tabIndex: tabIndex,
              tasks: tasks,
              frequencies: frequencies,
              evaluations: evaluations,
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFAB(tabIndex),
    );
  }

  /// Build FAB based on selected tab
  Widget? _buildFAB(int tabIndex) {
    IconData icon;
    VoidCallback onPressed;
    String tooltip;

    switch (tabIndex) {
      case 0: // TASK TAB
        icon = Icons.add;
        tooltip = 'Add Task';
        onPressed = () {
          context.push(addTaskRoute);
        };
        break;
      case 1: // FREQUENCY TAB
        icon = Icons.add;
        tooltip = 'Add Frequency';
        onPressed = () => _showAddFrequencyDialog();
        break;
      case 2: // EVALUATION TAB
        icon = Icons.add;
        tooltip = 'Add Evaluation';
        onPressed = () => _showAddEvaluationDialog();
        break;
      case 3: // SCORE TAB
        return null; // No FAB for score tab
      default:
        return null;
    }

    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }

  // void _showAddTaskDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (_) => const AddTaskDialog(),
  //   );
  // }

  void _showAddFrequencyDialog() {
    showDialog(
      context: context,
      builder: (_) => const AddFrequencyDialog(),
    );
  }

  void _showAddEvaluationDialog() {
    showDialog(
      context: context,
      builder: (_) => const AddEvaluationDialog(),
    );
  }

  Widget _buildTabContent({
    required int tabIndex,
    required List<TaskIsar> tasks,
    required List<FrequencyIsar> frequencies,
    required List<EvaluationIsar> evaluations,
  }) {
    switch (tabIndex) {
      case 0: // TASK
        return TaskTab(
          items: tasks,
          frequencyCache: frequencyCache,
        );
      case 1: // FREQUENCY
        return FrequencyTab(items: frequencies);
      case 2: // EVALUATION
        return EvaluationTab(items: evaluations);
      case 3: // SCORE
        return const ScoreTab();
      default:
        return const SizedBox();
    }
  }
}