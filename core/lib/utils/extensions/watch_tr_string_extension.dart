import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension LocaleObserver on String {
  String watchTr(
      BuildContext context, {
        List<String>? args,
        Map<String, String>? namedArgs,
        String? gender,
      }) {
    context.locale;
    return this.tr(args: args, namedArgs: namedArgs, gender: gender);
  }
}