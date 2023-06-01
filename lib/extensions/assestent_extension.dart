import 'package:flutter/material.dart';

extension AssetExtension on num {
  SizedBox get hSizedBox => SizedBox(height: toDouble());
  SizedBox get wSizedBox => SizedBox(width: toDouble());
}

extension Colored on String {
  Color getColorFromHex() {
    String formattedHexCode = replaceAll("#", "");
    int parsedHexCode = int.parse(formattedHexCode, radix: 16);

    return Color(0xff000000 + parsedHexCode);
  }
}
