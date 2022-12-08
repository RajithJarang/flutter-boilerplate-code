// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on _ThemeStore, Store {
  Computed<bool>? _$darkModeComputed;

  @override
  bool get darkMode => (_$darkModeComputed ??=
          Computed<bool>(() => super.darkMode, name: '_ThemeStore.darkMode'))
      .value;

  late final _$_darkModeAtom =
      Atom(name: '_ThemeStore._darkMode', context: context);

  @override
  bool get _darkMode {
    _$_darkModeAtom.reportRead();
    return super._darkMode;
  }

  @override
  set _darkMode(bool value) {
    _$_darkModeAtom.reportWrite(value, super._darkMode, () {
      super._darkMode = value;
    });
  }

  late final _$changeThemeModeAsyncAction =
      AsyncAction('_ThemeStore.changeThemeMode', context: context);

  @override
  Future<void> changeThemeMode(bool value) {
    return _$changeThemeModeAsyncAction.run(() => super.changeThemeMode(value));
  }

  @override
  String toString() {
    return '''
darkMode: ${darkMode}
    ''';
  }
}
