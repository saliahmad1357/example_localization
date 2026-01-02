import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/isar/frequencyIsar.dart';
import '../../../../providers/frequencyProvider.dart';

class AddFrequencyDialog extends ConsumerStatefulWidget {
  const AddFrequencyDialog({super.key});

  @override
  ConsumerState<AddFrequencyDialog> createState() => _AddFrequencyDialogState();
}

class _AddFrequencyDialogState extends ConsumerState<AddFrequencyDialog> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Frequency'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Frequency Name',
              hintText: 'e.g., Daily, Weekly, Monthly',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Examples: Daily, Weekly, Monthly, Bi-weekly, Quarterly',
              style: TextStyle(fontSize: 12, color: Colors.blue),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveFrequency,
          child: const Text('Save'),
        ),
      ],
    );
  }

  void _saveFrequency() async {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a frequency name')),
      );
      return;
    }

    final newFrequency = FrequencyIsar()
      ..userId = 1 // Default user ID
      ..name = nameController.text;

    try {
      await ref.read(frequencyProvider.notifier).addFrequency(newFrequency);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Frequency added successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
