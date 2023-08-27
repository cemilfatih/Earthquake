import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utility/enum/theme.dart';

class ThemeNotifier extends ChangeNotifier{

   ThemeData _currentTheme = ThemeData.dark();

  AppTheme _currentAppThemeEnum = AppTheme.DARK;

  AppTheme get currentAppThemeEnum => _currentAppThemeEnum;
  ThemeData get currentTheme => _currentTheme;

  void changeTheme() {
    if (_currentAppThemeEnum == AppTheme.DARK) {
      _currentTheme = ThemeData.light();
      _currentAppThemeEnum = AppTheme.LIGHT;
    } else if (_currentAppThemeEnum == AppTheme.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currentAppThemeEnum = AppTheme.DARK;
    }
    notifyListeners();
  }
}

