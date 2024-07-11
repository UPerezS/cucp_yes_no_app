import 'package:flutter/material.dart';

// Tema a partir de un color hex
const Color _customColor = Color(0xFF017F96);

// Lista de temas predefinidos
const List<Color> _colorThemes = [
  _customColor, 
  Color.fromARGB(255, 49, 153, 238),
  Color.fromARGB(255, 16, 226, 205),
  Color.fromARGB(255, 110, 205, 113),
  Color.fromARGB(255, 255, 236, 63),
  Color.fromARGB(255, 241, 168, 58),
  Color.fromARGB(255, 216, 15, 82)
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }) : assert (
    selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
    'El color se debe encontrar entre 0 y ${_colorThemes.length - 1}'
  );

  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colorThemes[2]);
  }
}
