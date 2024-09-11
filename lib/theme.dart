import 'package:flutter/material.dart';

final theme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(184, 245, 140, 228),
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(184, 245, 140, 228),
      foregroundColor: Colors.white,
    ),
  ),
);