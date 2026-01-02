
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: DropdownButton<Locale>(
            value: context.locale, // ✅ Always reflect EasyLocalization's locale
            onChanged: (locale) async {
              if (locale != null) {
                await context.setLocale(locale);
                // ✅ Wait for localization to update before syncing Riverpod
                Future.delayed(const Duration(milliseconds: 100), () {
                  ref.read(localeProvider.notifier).state = locale;
                });
              }
            },
            items: [
              DropdownMenuItem(
                value: const Locale('en'),
                child: Text(tr('languageOptionEnglish')),
              ),
              DropdownMenuItem(
                value: Locale('ar'),
                child: Text(tr('languageOptionArabic')),
              ),
              DropdownMenuItem(
                value: Locale('es'),
                child: Text(tr('languageOptionSpanish')),
              ),
              DropdownMenuItem(
                value: Locale('ur'),
                child: Text(tr('languageOptionUrdu')),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          tr('notificationMessage'),
          style: const TextStyle(fontSize: 18),
        ),
        SwitchListTile(
          title: Text('Dark Mode'),
          value: themeMode == ThemeMode.dark,
          // activeColor: Theme.of(context).colorScheme.primary,
          // inactiveThumbColor: Theme.of(context).colorScheme.secondary,
          // inactiveTrackColor: Theme.of(context).colorScheme.surfaceContainerHigh,
          onChanged: (value) {
            ref.read(themeProvider.notifier).state =
                value ? ThemeMode.dark : ThemeMode.light;
          },
        ),
      ],
    );
  }
}
