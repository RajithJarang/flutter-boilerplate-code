import 'package:cybernate_retail_mobile/data/shared_prefs/sharedpref_helper.dart';

class Repository {
  final SharedPreferenceHelper _sharedPreferenceHelper;

  Repository(
    this._sharedPreferenceHelper,
  );

  //Introduction screen functions

  bool? get checkIfIntroductionIsDone {
    return _sharedPreferenceHelper.checkIfIntroductionIsDone;
  }

  Future<bool> setIntroductionIsDone() {
    return _sharedPreferenceHelper.setIntroductionIsDone();
  }

  //Theme screen functions

  bool get isDarkMode {
    return _sharedPreferenceHelper.isDarkMode;
  }

  Future<void> changeThemeMode(bool value) {
    return _sharedPreferenceHelper.changeThemeMode(value);
  }

  //Language store

  String? get getCurrentLanguage {
    return _sharedPreferenceHelper.getCurrentLanguage;
  }

  Future<void> changeCurrentLanguage(String language) {
    return _sharedPreferenceHelper.changeLanguage(language);
  }

  //Profile Store
  bool? get getProfileInputDone {
    return _sharedPreferenceHelper.getProfileInputDone();
  }
}
