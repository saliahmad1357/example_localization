import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/tabProvider.dart';

class TabBarLocal extends ConsumerWidget {
  final int tabIndex;

  const TabBarLocal({
    required this.tabIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = [
      tr('taskTitle'),
      tr('frequenciesTitle'),
      tr('evaluationTitle'),
      tr('scoreTitle'),
    ];

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = tabIndex == index;

          return GestureDetector(
            onTap: () => ref.read(tabProvider.notifier).setTab(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
