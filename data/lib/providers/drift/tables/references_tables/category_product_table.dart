import 'package:drift/drift.dart';

class CategoryProductLinksTable extends Table {
  IntColumn get categoryId => integer().customConstraint('REFERENCES category_table(id)')();
  IntColumn get productId => integer().customConstraint('REFERENCES product_table(id)')();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{categoryId, productId};
}