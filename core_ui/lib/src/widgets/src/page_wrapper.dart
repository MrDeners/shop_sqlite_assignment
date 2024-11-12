import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;

  const PageWrapper({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: AppColors.mainBackgroundGradient),
      ),
      child: child,
    );
  }
}
