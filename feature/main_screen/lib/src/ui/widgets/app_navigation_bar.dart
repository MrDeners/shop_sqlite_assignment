import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../bloc/main_screen_bloc.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (BuildContext context, MainScreenState state) {
        return BottomNavigationBar(
          backgroundColor: context.theme.colors.blackBackground.withOpacity(0.7),
          selectedItemColor: context.theme.colors.whiteBackground,
          unselectedItemColor: context.theme.colors.whiteBackground.withOpacity(0.54),
          selectedLabelStyle: AppFonts.heading2,
          unselectedLabelStyle: AppFonts.heading3,
          currentIndex: context.read<MainScreenBloc>().state.currentPageIndex,
          onTap: (int index) {
            context.read<MainScreenBloc>().add(
                  ChangeCurrentPageEvent(currentPageIndex: index),
                );
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: AppIcons.home.call(
                size: state.currentPageIndex == 0
                    ? AppDimens.navigationBarSelectedIconSize
                    : AppDimens.navigationBarUnselectedIconSize,
                color: context.theme.colors.whiteBackground,
              ),
              label: LocaleKeys.navigationBar_shop.watchTr(context),
            ),
            BottomNavigationBarItem(
              icon: AppIcons.note.call(
                size: state.currentPageIndex == 1
                    ? AppDimens.navigationBarSelectedIconSize
                    : AppDimens.navigationBarUnselectedIconSize,
                color: context.theme.colors.whiteBackground,
              ),
              label: LocaleKeys.navigationBar_order.watchTr(context),
            ),
          ],
        );
      },
    );
  }
}
