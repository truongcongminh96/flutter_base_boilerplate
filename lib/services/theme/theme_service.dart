import 'package:flutter/material.dart';
import 'package:flutter_base_structure/constants/app_theme.dart';
import 'package:flutter_base_structure/interfaces/theme/interfaces/i_theme_repository.dart';

class ThemeService {
  ThemeService(IThemeRepository themeRepository)
      : _themeRepository = themeRepository;

  IThemeRepository _themeRepository;

  Future<ThemeData> getTheme() async {
    final String themeKey = await _themeRepository.getThemeKey();

    if (themeKey == null) {
      await _themeRepository.setThemeKey(lightTheme.brightness);

      return lightTheme;
    } else {
      return themeKey == "light" ? lightTheme : darkTheme;
    }
  }

  Future<ThemeData> switchTheme(ThemeData theme) async {
    if (theme == lightTheme) {
      theme = darkTheme;
    } else {
      theme = lightTheme;
    }

    await _themeRepository.setThemeKey(theme.brightness);
    return theme;
  }
}
