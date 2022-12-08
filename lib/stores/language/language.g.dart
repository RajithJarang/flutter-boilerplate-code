// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LanguageStore on _LanguageStore, Store {
  Computed<String>? _$localeComputed;

  @override
  String get locale => (_$localeComputed ??=
          Computed<String>(() => super.locale, name: '_LanguageStore.locale'))
      .value;

  late final _$_localeAtom =
      Atom(name: '_LanguageStore._locale', context: context);

  @override
  String get _locale {
    _$_localeAtom.reportRead();
    return super._locale;
  }

  @override
  set _locale(String value) {
    _$_localeAtom.reportWrite(value, super._locale, () {
      super._locale = value;
    });
  }

  late final _$setCurrentLanguageAsyncAction =
      AsyncAction('_LanguageStore.setCurrentLanguage', context: context);

  @override
  Future<void> setCurrentLanguage(String language) {
    return _$setCurrentLanguageAsyncAction
        .run(() => super.setCurrentLanguage(language));
  }

  @override
  String toString() {
    return '''
locale: ${locale}
    ''';
  }
}
