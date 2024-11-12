import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../constants/database_constants.dart';
import '../tables/order_table.dart';
import '../tables/tables.dart';

part 'drift_database_provider.g.dart';

part 'setup_database_data_extension.dart';

part 'trigger_database_extension.dart';

@DriftDatabase(
  tables: <Type>[
    CategoryProductLinksTable,
    AppStatisticTable,
    CategoryTable,
    ProductTable,
    OrderTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator migrator) async {
          await migrator.createAll();
          await setupDatabaseData();
          await setupDatabaseTriggers();
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final Directory dbFolder = await getApplicationDocumentsDirectory();
      final File file = File(p.join(dbFolder.path, DatabaseConstants.databaseFileName));
      print(dbFolder.path);

      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }

      final String cacheBase = (await getTemporaryDirectory()).path;
      sqlite3.tempDirectory = cacheBase;

      return NativeDatabase.createInBackground(file);
    },
  );
}
