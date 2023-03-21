import 'package:flutter/material.dart';

extension AssetExtension on num {
  SizedBox get hSizedBox => SizedBox(height: toDouble());
  SizedBox get wSizedBox => SizedBox(width: toDouble());
}
