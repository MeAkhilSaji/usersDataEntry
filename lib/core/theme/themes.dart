part of '../core_ui.dart';

const Color primaryColor = Color(0xFF06a7d5);

class ThemeInfo {
  static ThemeData theme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    // useMaterial3: true,
  );
}
