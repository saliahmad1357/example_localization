// providers/taskTabProvider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabNotifier extends StateNotifier<int> {
  TabNotifier() : super(0);  // 0 = Task tab auto selected

  void setTab(int index) => state = index;
}

final tabProvider =
    StateNotifierProvider<TabNotifier, int>((ref) => TabNotifier());
