import 'package:flutter/material.dart';

void navigate(
    {required BuildContext context, required String routeName, dynamic arg}) {
  Navigator.pushNamed(context, routeName, arguments: arg);
}
