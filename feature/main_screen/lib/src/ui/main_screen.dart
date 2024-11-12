import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/main_screen_bloc.dart';
import 'widgets/widgets.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenBloc>(
      create: (BuildContext context) => MainScreenBloc(),
      child: Scaffold(
        bottomNavigationBar: const AppNavigationBar(),
        body: BlocBuilder<MainScreenBloc, MainScreenState>(
          builder: (BuildContext context, MainScreenState state) {
            return PageWrapper(
              child: SafeArea(
                child: <Widget>[
                  const ShopScreen(),
                  const OrderScreen(),
                ][state.currentPageIndex],
              ),
            );
          },
        ),
      ),
    );
  }
}
