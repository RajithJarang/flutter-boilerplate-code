import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences_constants.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  SharedPreferenceHelper(this._sharedPreference);

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference.getBool(PreferencesConstants.darkMode) ?? false;
  }

  Future<void> changeThemeMode(bool value) {
    return _sharedPreference.setBool(PreferencesConstants.darkMode, value);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference.getString(PreferencesConstants.currentLanguage);
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference.setString(
        PreferencesConstants.currentLanguage, language);
  }

  // Introduction screen:---------------------------------------

  bool? get checkIfIntroductionIsDone {
    return _sharedPreference.getBool(PreferencesConstants.introductionScreen);
  }

  Future<bool> setIntroductionIsDone() {
    return _sharedPreference.setBool(
        PreferencesConstants.introductionScreen, true);
  }

  //Language: ---------------------------------------------------

  String? get getCurrentLanguage {
    return _sharedPreference.getString(PreferencesConstants.currentLanguage);
  }

  Future<bool> setCurrentLanguage(String language) {
    return _sharedPreference.setString(
        PreferencesConstants.currentLanguage, language);
  }

//Profile: ---------------------------------------------------

  bool? getProfileInputDone() {
    return _sharedPreference.getBool(PreferencesConstants.profileInput);
  }

  Future<bool> setProfileInputDone(bool value) {
    return _sharedPreference.setBool(PreferencesConstants.profileInput, value);
  }
}
