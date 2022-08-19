import 'package:flutter/cupertino.dart';

class ColorGradient {
  static Color color00 = const Color(0xFFFDEDF4);
  static Color color01 = const Color(0xFFFBF0F4);
  static Color color02 = const Color(0xFFF4F4F4);
  static Color color03 = const Color(0xFFF0F0F3);
  static Color color04 = const Color(0xFFE9EAF2);
  static Color color05 = const Color(0xFFE4E5F1);

  static Decoration deco = BoxDecoration(
    borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
    gradient: LinearGradient(
        begin: const Alignment(-1, -1),
        end: const Alignment(1, 1),
        colors: [color00, color01, color02, color03, color04, color05],
        stops: const [0.0, 0.18, 0.42, 0.59, 0.79, 0.94],
        tileMode: TileMode.clamp),
  );
}
