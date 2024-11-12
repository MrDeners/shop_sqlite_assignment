library history;

import 'package:navigation/navigation.dart';

export 'order.gm.dart';
export 'src/ui/order_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form|Step,Route')
class OrderModule extends $OrderModule {}
