class FrequencyBucket {
  static DateTime bucketStart(String frequency, DateTime date) {
    switch (frequency) {
      case 'daily':
        return DateTime(date.year, date.month, date.day);

      case 'weekly':
        final monday =
            date.subtract(Duration(days: date.weekday - 1));
        return DateTime(monday.year, monday.month, monday.day);

      case 'monthly':
        return DateTime(date.year, date.month, 1);

      case 'yearly':
        return DateTime(date.year, 1, 1);

      default:
        throw Exception('Invalid frequency: $frequency');
    }
  }

  static DateTime nextBucket(String frequency, DateTime date) {
    switch (frequency) {
      case 'daily':
        return date.add(const Duration(days: 1));

      case 'weekly':
        return date.add(const Duration(days: 7));

      case 'monthly':
        return DateTime(date.year, date.month + 1, 1);

      case 'yearly':
        return DateTime(date.year + 1, 1, 1);

      default:
        throw Exception('Invalid frequency: $frequency');
    }
  }
}
