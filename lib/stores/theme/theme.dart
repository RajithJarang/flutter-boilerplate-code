import 'package:cybernate_retail_mobile/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final Repository _repository;
  _ThemeStore(this._repository);

  @observable
  bool _darkMode = false;

  @computed
  bool get darkMode => _darkMode;

  @action
  Future<void> changeThemeMode(bool value) async {
    _darkMode = value;
    await _repository.changeThemeMode(value);
  }

  Future init() async {
    _darkMode = _repository.isDarkMode;
  }

  bool isPlatformDark(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.dark;
}
