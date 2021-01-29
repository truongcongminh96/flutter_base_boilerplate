import 'package:flutter/material.dart';
import 'package:flutter_base_structure/constants/app_theme.dart';
import 'package:flutter_base_structure/services/theme/theme_service.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore extends _ThemeStore with _$ThemeStore {
  ThemeStore(ThemeService themeService) : super(themeService);
}

abstract class _ThemeStore with Store {
  _ThemeStore(this._themeService);

  final ThemeService _themeService;

  @computed
  bool get isDark => theme.brightness == Brightness.dark;

  @observable
  ThemeData theme;

  @action
  Future<void> getTheme() async {
    theme = lightTheme;
    theme = await _themeService.getTheme();
  }

  @action
  Future<void> switchTheme() async {
    theme = await _themeService.switchTheme(theme);
  }
}
