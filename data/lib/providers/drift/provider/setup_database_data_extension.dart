part of 'drift_database_provider.dart';

extension SetupDatabase on AppDatabase {
  Future<void> setupDatabaseData() async {
    await into(categoryTable).insert(
      CategoryTableCompanion.insert(
        name: 'Technique',
        description: 'Category for products with technique',
      ),
    );

    await into(categoryTable).insert(
      CategoryTableCompanion.insert(
        name: 'Food',
        description: 'Category for products with food',
      ),
    );

    await into(productTable).insert(
      ProductTableCompanion.insert(
        name: 'Smartphone',
        imageUrl: 'https://pngimg.com/uploads/iphone_14/small/iphone_14_PNG6.png',
      ),
    );

    await into(categoryProductLinksTable).insert(
      CategoryProductLinksTableCompanion.insert(
        categoryId: 1,
        productId: 1,
      ),
    );

    await into(productTable).insert(
      ProductTableCompanion.insert(
        name: 'PC',
        imageUrl: 'https://pngimg.com/d/computer_pc_PNG17489.png',
      ),
    );

    await into(categoryProductLinksTable).insert(
      CategoryProductLinksTableCompanion.insert(
        categoryId: 1,
        productId: 2,
      ),
    );

    await into(productTable).insert(
      ProductTableCompanion.insert(
        name: 'Fridge',
        imageUrl:
            'https://purepng.com/public/uploads/large/purepng.com-refrigeratorrefrigeratorfridgeiceboxrefrigeratoryfreezer-17015283688270hzmo.png',
      ),
    );

    await into(categoryProductLinksTable).insert(
      CategoryProductLinksTableCompanion.insert(
        categoryId: 1,
        productId: 3,
      ),
    );

    await into(productTable).insert(
      ProductTableCompanion.insert(
        name: 'Coke',
        imageUrl: 'https://pngfre.com/wp-content/uploads/coca-cola.png',
      ),
    );

    await into(categoryProductLinksTable).insert(
      CategoryProductLinksTableCompanion.insert(
        categoryId: 2,
        productId: 4,
      ),
    );

    await into(productTable).insert(
      ProductTableCompanion.insert(
        name: 'BBQ',
        imageUrl: 'https://pngimg.com/uploads/barbecue/barbecue_PNG14.png',
      ),
    );

    await into(categoryProductLinksTable).insert(
      CategoryProductLinksTableCompanion.insert(
        categoryId: 2,
        productId: 5,
      ),
    );

    await into(productTable).insert(
      ProductTableCompanion.insert(
        name: 'Hamburger',
        imageUrl: 'https://pngimg.com/d/burger_sandwich_PNG4114.png',
      ),
    );

    await into(categoryProductLinksTable).insert(
      CategoryProductLinksTableCompanion.insert(
        categoryId: 2,
        productId: 6,
      ),
    );
  }
}
