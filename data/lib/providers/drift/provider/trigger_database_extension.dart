part of 'drift_database_provider.dart';

extension TriggerDatabase on AppDatabase {
  Future<void> setupDatabaseTriggers() async {
    await customStatement('''
        CREATE TRIGGER increment_categories_amount
        AFTER INSERT ON category_table
        FOR EACH ROW
        BEGIN
            UPDATE app_statistic_table
            SET categories_amount = categories_amount + 1;
        END;
      ''');

    await customStatement('''
        CREATE TRIGGER increment_products_amount
        AFTER INSERT ON product_table
        FOR EACH ROW
        BEGIN
            UPDATE app_statistic_table
            SET products_amount = products_amount + 1;
        END;
      ''');
  }
}
