import 'package:flutter/material.dart';

Widget genericHorizontalDivider(String label) => Row(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    Expanded(child: Divider()),
    Text('  $label  '),
    Expanded(child: Divider()),
  ],
);
