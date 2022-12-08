import '../../data/repository.dart';
import '../../data/shared_prefs/sharedpref_helper.dart';
import '../../dependency_injection/modules/localmodule.dart';
import '../../stores/introduction/introduction.dart';
import '../../stores/language/language.dart';
import '../../stores/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));

  getIt.registerSingleton(Repository(
    getIt<SharedPreferenceHelper>(),
  ));

  //Stores
  getIt.registerSingleton(IntroductionStore(getIt<Repository>()));
  getIt.registerSingleton(LanguageStore(getIt<Repository>()));
  getIt.registerSingleton(ThemeStore(getIt<Repository>()));
}
