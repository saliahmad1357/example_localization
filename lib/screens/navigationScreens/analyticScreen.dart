
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyticScreen extends ConsumerWidget {
  const AnalyticScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        tr('analyticMessage'),
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
