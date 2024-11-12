library shop;

import 'package:navigation/navigation.dart';

export 'shop.gm.dart';
export 'src/ui/shop_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form|Step,Route')
class ShopModule extends $ShopModule {}
