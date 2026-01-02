
import 'package:easy_localization/easy_localization.dart';
import 'package:example_localization/common/router/routesName.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/isar/taskIsar.dart';
import '../../../../providers/taskProvider.dart';
import '../tabsWidgets/scoreSlider.dart';
import '../utils/taskLocalizationHelper.dart';

class TaskTab extends ConsumerStatefulWidget {
  final List<TaskIsar> items;
  final Map<int, String> frequencyCache;

  const TaskTab({
    required this.items,
    required this.frequencyCache,
    super.key,
  });

  @override
  ConsumerState<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends ConsumerState<TaskTab> {
  // Default to 'Daily' which maps to ID 1
  String _selectedFilter = 'Daily';

  @override
  Widget build(BuildContext context) {
    final taskNotifier = ref.read(taskProvider.notifier);

    // Map the string label to the integer ID
    // 1 = Daily, 2 = Weekly, 3 = Monthly
    final int targetFrequencyId = switch (_selectedFilter) {
      'Daily' => 1,
      'Weekly' => 2,
      'Monthly' => 3,
      _ => 1, // Default fallback
    };

    // Filter the items based on the ID
    final filteredItems = widget.items.where((task) {
      return task.frequencyId == targetFrequencyId;
    }).toList();

    return Column(
      children: [
        // 1. Filter UI (Segmented Button)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: SizedBox(
            width: double.infinity,
            child: SegmentedButton<String>(
              segments: [
                ButtonSegment(
                  value: tr('frequenciesDaily'),
                  label: Text(tr('frequenciesDaily')),
                  icon: Icon(Icons.calendar_view_day),
                ),
                ButtonSegment(
                  value: tr('frequenciesWeekly'),
                  label: Text(tr('frequenciesWeekly')),
                  icon: Icon(Icons.calendar_view_week),
                ),
                ButtonSegment(
                  value: tr('frequenciesMonthly'),
                  label: Text(tr('frequenciesMonthly')),
                  icon: Icon(Icons.calendar_month),
                ),
              ],
              selected: {_selectedFilter},
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  _selectedFilter = newSelection.first;
                  // Optional: Deselect active task to avoid confusion if it disappears from view
                  // taskNotifier.setSelectedTaskIndex(-1);
                });
              },
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ),

        // 2. Task List
        Expanded(
          child: filteredItems.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.task_alt,
                          size: 48, color: Theme.of(context).disabledColor),
                      const SizedBox(height: 16),
                      Text(
                        'No $_selectedFilter tasks',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).disabledColor,
                            ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final task = filteredItems[index];
                    
                    // We need the original index for the provider selection logic
                    final originalIndex = widget.items.indexOf(task);

                    return _TaskTile(
                      key: ValueKey(task.id), // Performance optimization
                      item: task,
                      isSelected: taskNotifier.selectedTaskIndex == originalIndex,
                      frequencyCache: widget.frequencyCache,
                      onTap: () => taskNotifier.setSelectedTaskIndex(originalIndex),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _TaskTile extends ConsumerWidget {
  final TaskIsar item;
  final bool isSelected;
  final VoidCallback onTap;
  final Map<int, String> frequencyCache;

  const _TaskTile({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.frequencyCache,
  });

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(taskProvider.notifier).deleteTask(item.id);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task deleted')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).dividerColor,
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.15),
                  child: const Icon(CupertinoIcons.check_mark_circled),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getLocalizedTitle(item, context),
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 4),
                      Text(getLocalizedDescription(item, context),
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    context.push(addTaskRoute,extra: item);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => AddTaskScreen(task: item),//////dddddddddddd
                    //   ),
                    // );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _showDeleteConfirmation(context, ref);
                  },
                ),
              ],
            ),
            if (isSelected) ...[
              const SizedBox(height: 16),
              ScoreSlider(
                item: item,
                frequencyCache: frequencyCache,
              ),
            ],
          ],
        ),
      ),
    );
  }
}