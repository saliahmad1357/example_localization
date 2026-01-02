import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/isar/frequencyIsar.dart';
import '../../../../providers/frequencyProvider.dart';

class FrequencyTab extends ConsumerWidget {
  final List<FrequencyIsar> items;

  const FrequencyTab({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (items.isEmpty) {
      return const Center(child: Text('No frequencies available'));
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _FrequencyTile(item: item);
      },
    );
  }
}

class _FrequencyTile extends ConsumerWidget {
  final FrequencyIsar item;

  const _FrequencyTile({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor:
                Theme.of(context).colorScheme.secondary.withOpacity(0.15),
            child: const Icon(Icons.schedule),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text('ID: ${item.id}',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              _showEditFrequencyDialog(context, ref);
            },
          ),
        ],
      ),
    );
  }

  void _showEditFrequencyDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController(text: item.name);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit Frequency'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Frequency Name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              nameController.dispose();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                item.name = nameController.text;
                ref.read(frequencyProvider.notifier).updateFrequency(item);
                Navigator.pop(ctx);
                nameController.dispose();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Frequency updated')),
                );
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
