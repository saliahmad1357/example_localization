import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../models/isar/taskIsar.dart';

/// Get the localized title for a task based on current locale
String getLocalizedTitle(TaskIsar task, BuildContext context) {
  final locale = context.locale.languageCode;
  
  switch (locale) {
    case 'ar':
      return task.titleAr;
    case 'ur':
      return task.titleUr;
    case 'es':
      return task.titleEn; // Spanish uses English as fallback
    default:
      return task.titleEn; // English or default
  }
}

/// Get the localized description for a task based on current locale
String getLocalizedDescription(TaskIsar task, BuildContext context) {
  final locale = context.locale.languageCode;
  
  switch (locale) {
    case 'ar':
      return task.descriptionAr;
    case 'ur':
      return task.descriptionUr;
    case 'es':
      return task.descriptionEn; // Spanish uses English as fallback
    default:
      return task.descriptionEn; // English or default
  }
}
