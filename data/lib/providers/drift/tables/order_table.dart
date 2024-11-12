import 'package:drift/drift.dart';

class OrderTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  IntColumn get productId => integer()();
  IntColumn get amount => integer()();
}
