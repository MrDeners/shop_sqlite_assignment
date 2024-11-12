import 'package:drift/drift.dart';

class AppStatisticTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoriesAmount => integer().withDefault(const Constant<int>(0))();
  IntColumn get productsAmount => integer().withDefault(const Constant<int>(0))();
}
