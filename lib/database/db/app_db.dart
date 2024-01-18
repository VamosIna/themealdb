import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../entity/favorite_entity.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Favorite])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<FavoriteData>> getFavoriteList() async {
    return await select(favorite).get();
  }

  Future<FavoriteData?> getFavoriteId(String mealsId) async {
    return await (select(favorite)..where((tbl) => tbl.mealsId.equals(mealsId)))
        .getSingleOrNull();
  }

  Future<int> addFavorite(FavoriteCompanion entity) async {
    return await into(favorite).insert(entity);
  }

  Future<int> removeFavorite(String mealsId) async {
    return await (delete(favorite)..where((tbl) => tbl.mealsId.equals(mealsId)))
        .go();
  }
}
