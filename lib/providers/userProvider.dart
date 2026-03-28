import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/isar/userIsar.dart';
import '../services/isarService.dart';

final userProvider =
    AsyncNotifierProvider<UserNotifier, List<UserIsar>>(UserNotifier.new);

final currentUserProvider = Provider<AsyncValue<UserIsar?>>((ref) {
  return ref.watch(userProvider).whenData((users) => users.isNotEmpty ? users.first : null);
});

class UserNotifier extends AsyncNotifier<List<UserIsar>> {
  @override
  Future<List<UserIsar>> build() async {
    final isar = ref.read(isarServiceProvider);
    final db = await isar.db;

    final users = await db.userIsars.where().findAll();

    db.userIsars.watchLazy().listen((_) async {
      final updated = await db.userIsars.where().findAll();
      state = AsyncData(updated);
    });

    return users;
  }

  Future<void> refreshUser() async {
    state = const AsyncLoading();
    final isar = ref.read(isarServiceProvider);
    final db = await isar.db;
    final users = await db.userIsars.where().findAll();
    state = AsyncData(users);
  }

  Future<void> addUser(UserIsar user) async {
    final isar = await ref.read(isarServiceProvider);
    await isar.addUser(user);
  }

  Future<UserIsar?> getUserByEmail(String email) async {
    final isar = await ref.read(isarServiceProvider);
    return await isar.getUserByEmail(email);
  }

  Future<UserIsar?> getUserById(int id) async {
    final isar = await ref.read(isarServiceProvider);
    return await isar.getUserById(id);
  }
}
