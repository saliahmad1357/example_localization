
import 'package:easy_localization/easy_localization.dart';
import 'package:example_localization/services/notificationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final notify = NotificationService();
  // final scheduler = ref.read(NotificationService());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Text(
            tr('homeMessage'),
            style: const TextStyle(fontSize: 24),
          ),
          FloatingActionButton(onPressed:() => notify.showTestNotification() )
        ],
      )

    );
  }
}
