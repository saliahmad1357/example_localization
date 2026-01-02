import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/isar/taskIsar.dart';
import '../../../../providers/taskProvider.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  final TaskIsar? task;

  const AddTaskScreen({super.key, this.task});

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  int selectedFrequencyId = 1; // 1=Daily, 2=Weekly, 3=Monthly
  int selectedStartHour = 9;
  int selectedStartMinute = 0;
  int selectedEndHour = 17;
  int selectedEndMinute = 0;

  int? selectedDayOfWeek; // Weekly
  int? selectedDayOfMonth; // Monthly

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final locale = context.locale.languageCode;

    if (widget.task != null) {
      final task = widget.task!;

      titleController.text = _getLocalizedTitle(task, locale);
      descriptionController.text = _getLocalizedDescription(task, locale);

      selectedFrequencyId =
          (task.frequencyId >= 1 && task.frequencyId <= 3)
              ? task.frequencyId
              : 1;

      selectedStartHour = task.startTime.hour;
      selectedStartMinute = task.startTime.minute;
      selectedEndHour = task.hour;
      selectedEndMinute = task.minute;

      selectedDayOfWeek = task.dayOfWeek;
      selectedDayOfMonth = task.dayOfMonth;
    }

    _initialized = true;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.task != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? tr('editTask') : tr('addTask')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTaskFields(),
            const SizedBox(height: 24),
            _buildFrequencySection(),
            const SizedBox(height: 16),
            if (selectedFrequencyId == 2) _buildWeeklySelector(),
            if (selectedFrequencyId == 3) _buildMonthlySelector(),
            const SizedBox(height: 24),
            _buildTimeSection(),
            const SizedBox(height: 32),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  // ---------------- UI SECTIONS ----------------

  Widget _buildTaskFields() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: tr('taskTitle'),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: tr('taskDescription'),
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrequencySection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButtonFormField<int>(
          value: selectedFrequencyId,
          decoration: InputDecoration(
            labelText: tr('frequency'),
            border: const OutlineInputBorder(),
          ),
          items: [
            DropdownMenuItem(value: 1, child: Text(tr('frequenciesDaily'))),
            DropdownMenuItem(value: 2, child: Text(tr('frequenciesWeekly'))),
            DropdownMenuItem(value: 3, child: Text(tr('frequenciesMonthly'))),
          ],
          onChanged: (value) {
            setState(() {
              selectedFrequencyId = value!;
            });
          },
        ),
      ),
    );
  }

  Widget _buildWeeklySelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButtonFormField<int>(
          value: selectedDayOfWeek ?? 1,
          decoration: InputDecoration(
            labelText: tr('selectDayOfWeek'),
            border: const OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(value: 1, child: Text('Monday')),
            DropdownMenuItem(value: 2, child: Text('Tuesday')),
            DropdownMenuItem(value: 3, child: Text('Wednesday')),
            DropdownMenuItem(value: 4, child: Text('Thursday')),
            DropdownMenuItem(value: 5, child: Text('Friday')),
            DropdownMenuItem(value: 6, child: Text('Saturday')),
            DropdownMenuItem(value: 7, child: Text('Sunday')),
          ],
          onChanged: (v) => setState(() => selectedDayOfWeek = v),
        ),
      ),
    );
  }

  Widget _buildMonthlySelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButtonFormField<int>(
          value: selectedDayOfMonth ?? 1,
          decoration: InputDecoration(
            labelText: tr('selectDayOfMonth'),
            border: const OutlineInputBorder(),
          ),
          items: List.generate(
            31,
            (i) => DropdownMenuItem(value: i + 1, child: Text('${i + 1}')),
          ),
          onChanged: (v) => setState(() => selectedDayOfMonth = v),
        ),
      ),
    );
  }

  Widget _buildTimeSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _timeRow(
              tr('startTime'),
              selectedStartHour,
              selectedStartMinute,
              (v) => setState(() => selectedStartHour = v),
              (v) => setState(() => selectedStartMinute = v),
            ),
            const SizedBox(height: 16),
            _timeRow(
              tr('endTime'),
              selectedEndHour,
              selectedEndMinute,
              (v) => setState(() => selectedEndHour = v),
              (v) => setState(() => selectedEndMinute = v),
            ),
          ],
        ),
      ),
    );
  }

  Widget _timeRow(
    String label,
    int hour,
    int minute,
    ValueChanged<int> onHour,
    ValueChanged<int> onMinute,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _hourDropdown(hour, onHour)),
            const SizedBox(width: 12),
            Expanded(child: _minuteDropdown(minute, onMinute)),
          ],
        ),
      ],
    );
  }

  Widget _hourDropdown(int value, ValueChanged<int> onChanged) {
    return DropdownButtonFormField<int>(
      value: value,
      decoration: const InputDecoration(border: OutlineInputBorder()),
      items: List.generate(
        24,
        (i) => DropdownMenuItem(value: i, child: Text(i.toString().padLeft(2, '0'))),
      ),
      onChanged: (v) => onChanged(v!),
    );
  }

  Widget _minuteDropdown(int value, ValueChanged<int> onChanged) {
    return DropdownButtonFormField<int>(
      value: value,
      decoration: const InputDecoration(border: OutlineInputBorder()),
      items: List.generate(
        60,
        (i) => DropdownMenuItem(value: i, child: Text(i.toString().padLeft(2, '0'))),
      ),
      onChanged: (v) => onChanged(v!),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.close),
            label: Text(tr('cancel')),
            onPressed: () => context.pop(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.check),
            label: Text(widget.task != null ? tr('update') : tr('save')),
            onPressed: _saveTask,
          ),
        ),
      ],
    );
  }

  // ---------------- SAVE LOGIC ----------------

  void _saveTask() async {
    final locale = context.locale.languageCode;

    final startTime = DateTime.now().copyWith(
      hour: selectedStartHour,
      minute: selectedStartMinute,
    );

    final endTime = DateTime.now().copyWith(
      hour: selectedEndHour,
      minute: selectedEndMinute,
    );

    final task = widget.task ?? TaskIsar()
      ..userId = 1
      ..titleEn = ''
      ..descriptionEn = ''
      ..titleAr = ''
      ..descriptionAr = ''
      ..titleUr = ''
      ..descriptionUr = '';

    _applyLocalizedText(task, locale);

    task
      ..frequencyId = selectedFrequencyId
      ..dayOfWeek = selectedFrequencyId == 2 ? selectedDayOfWeek : null
      ..dayOfMonth = selectedFrequencyId == 3 ? selectedDayOfMonth : null
      ..startTime = startTime
      ..endTime = endTime
      ..hour = selectedStartHour
      ..minute = selectedStartMinute
      ..updatedAt = DateTime.now();

    final notifier = ref.read(taskProvider.notifier);

    widget.task == null
        ? await notifier.addTask(task)
        : await notifier.updateTask(task);

    context.pop();
  }

  // ---------------- LOCALIZATION HELPERS ----------------

  String _getLocalizedTitle(TaskIsar task, String lang) =>
      lang == 'ar'
          ? task.titleAr
          : lang == 'ur'
              ? task.titleUr
              : task.titleEn;

  String _getLocalizedDescription(TaskIsar task, String lang) =>
      lang == 'ar'
          ? task.descriptionAr
          : lang == 'ur'
              ? task.descriptionUr
              : task.descriptionEn;

  void _applyLocalizedText(TaskIsar task, String lang) {
    if (lang == 'ar') {
      task.titleAr = titleController.text;
      task.descriptionAr = descriptionController.text;
    } else if (lang == 'ur') {
      task.titleUr = titleController.text;
      task.descriptionUr = descriptionController.text;
    } else {
      task.titleEn = titleController.text;
      task.descriptionEn = descriptionController.text;
    }
  }
}
