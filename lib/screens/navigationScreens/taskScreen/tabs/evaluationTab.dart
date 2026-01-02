import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/isar/evaluationIsar.dart';
import '../../../../providers/evaluationProvider.dart';
import '../screens/addEvaluationScreen.dart';

class EvaluationTab extends ConsumerWidget {
  final List<EvaluationIsar> items;

  const EvaluationTab({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (items.isEmpty) {
      return const Center(child: Text('No evaluations available'));
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _EvaluationTile(item: item);
      },
    );
  }
}

class _EvaluationTile extends ConsumerWidget {
  final EvaluationIsar item;

  const _EvaluationTile({required this.item});

  String _getFrequencyLabel() {
    if (item.dayOfMonth != null) return 'Monthly (Day ${item.dayOfMonth})';
    if (item.dayOfWeek != null) return 'Weekly (${_getDayName(item.dayOfWeek!)})';
    return 'Daily';
  }

  String _getDayName(int dayOfWeek) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[dayOfWeek - 1];
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Evaluation'),
        content:
            const Text('Are you sure you want to delete this evaluation?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(evaluationProvider.notifier).deleteEvaluation(item.id);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Evaluation deleted')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  IconData _getFrequencyIcon() {
    if (item.dayOfMonth != null) return Icons.calendar_month;
    if (item.dayOfWeek != null) return Icons.calendar_today;
    return Icons.repeat;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeString =
        '${item.hour.toString().padLeft(2, '0')}:${item.minute.toString().padLeft(2, '0')}';
    final createdDate = item.createdAt.toString().split(' ')[0];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor:
                    Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
                child: Icon(
                  Icons.assessment,
                  color: Theme.of(context).colorScheme.tertiary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ID: ${item.id}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Row(
                      children: [
                        Icon(Icons.edit, size: 18),
                        SizedBox(width: 8),
                        Text('Edit'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddEvaluationScreen(evaluation: item),
                        ),
                      );
                    },
                  ),
                  PopupMenuItem(
                    child: const Row(
                      children: [
                        Icon(Icons.delete, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Delete', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                    onTap: () {
                      _showDeleteConfirmation(context, ref);
                    },
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 16),
          // Details Grid
          Row(
            children: [
              Expanded(
                child: _DetailChip(
                  icon: Icons.schedule,
                  label: 'Time',
                  value: timeString,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _DetailChip(
                  icon: _getFrequencyIcon(),
                  label: 'Frequency',
                  value: _getFrequencyLabel(),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _DetailChip(
                  icon: Icons.notifications_active,
                  label: 'Sound',
                  value: item.sound.isNotEmpty ? '✓ Active' : 'Silent',
                  color: item.sound.isNotEmpty
                      ? Colors.green
                      : Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _DetailChip(
                  icon: Icons.calendar_today,
                  label: 'Created',
                  value: createdDate,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _DetailChip({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
