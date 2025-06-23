// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/sembast_io.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast_web/sembast_web.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

enum StorageKey {
  authAccessToken("auth_access_token"),
  authRefreshToken("auth_refresh_token");

  final String name;
  const StorageKey(this.name);
}

class Storage {
  late final Database db;
  late final StoreRef<String, String> stringStore;
  late final StoreRef<String, int> intStore;
  late final StoreRef<String, Map<String, dynamic>> mapStore;
  late final StoreRef<String, List<dynamic>> listStore;

  Future<void> init() async {
    if (kIsWeb) {
      db = await databaseFactoryWeb.openDatabase("houston.db");
    } else {
      final appDir = await getApplicationDocumentsDirectory();
      await appDir.create(recursive: true);
      final databasePath = join(appDir.path, "houston.db");
      db = await databaseFactoryIo.openDatabase(databasePath);
    }

    stringStore = StoreRef<String, String>.main();
    intStore = StoreRef<String, int>.main();
    mapStore = StoreRef<String, Map<String, dynamic>>.main();
    listStore = StoreRef<String, List<dynamic>>.main();
  }

  Future<String?> getString(StorageKey key) async {
    return await stringStore.record(key.name).get(db);
  }

  Future<void> setString(StorageKey key, String value) async {
    await stringStore.record(key.name).put(db, value);
  }

  Future<void> removeString(StorageKey key) async {
    await stringStore.record(key.name).delete(db);
  }

  Future<int?> getInt(StorageKey key) async {
    return await intStore.record(key.name).get(db);
  }

  Future<void> setInt(StorageKey key, int value) async {
    await intStore.record(key.name).put(db, value);
  }

  Future<void> removeInt(StorageKey key) async {
    await intStore.record(key.name).delete(db);
  }

  Future<Map<String, dynamic>?> getMap(StorageKey key) async {
    return await mapStore.record(key.name).get(db);
  }

  Future<void> setMap(StorageKey key, Map<String, dynamic> value) async {
    await mapStore.record(key.name).put(db, value);
  }

  Future<void> removeMap(StorageKey key) async {
    await mapStore.record(key.name).delete(db);
  }

  Future<List<dynamic>?> getList(StorageKey key) async {
    return await listStore.record(key.name).get(db);
  }

  Future<void> setList(StorageKey key, List<dynamic> value) async {
    await listStore.record(key.name).put(db, value);
  }

  Future<void> removeList(StorageKey key) async {
    await listStore.record(key.name).delete(db);
  }
}

class StorageNotifier extends AsyncNotifier<Storage> {
  @override
  Future<Storage> build() async {
    final service = Storage();
    await service.init();
    return service;
  }
}

final storageProvider = Provider<Storage>((ref) {
  throw UnimplementedError(
    'singletonProvider was accessed before initialization',
  );
});
