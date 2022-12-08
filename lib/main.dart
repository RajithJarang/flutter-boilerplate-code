import 'dart:async';
import './data/repository.dart';
import './dependency_injection/components/services.dart';
import './global_theme/apptheme.dart';
import './routes/routes.dart';
import './stores/introduction/introduction.dart';
import './stores/language/language.dart';
import './stores/profile/profile.dart';
import './stores/theme/theme.dart';
import './ui/home/home.dart';
import './ui/introduction/introduction.dart';
import './ui/profile/profile.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

const SENTRY_ENDPOINT = 'url';

Future<void> main() async {
  return runZonedGuarded(() async {
    await Sentry.init(
      (options) {
        options.dsn = SENTRY_ENDPOINT;
        options.tracesSampleRate = 1.0;
      },
    );
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    runApp(MyApp());
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}

class MyApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  MyApp({super.key});

  final IntroductionStore _introductionStore =
      IntroductionStore(getIt<Repository>());
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());
  final ProfileStore _profileStore = ProfileStore(getIt<Repository>());
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => _introductionStore),
        Provider(create: (_) => _themeStore),
        Provider(create: (_) => _languageStore),
        Provider(create: (_) => _profileStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'app',
            theme: _themeStore.darkMode
                ? AppThemeData.darkThemeData
                : AppThemeData.lightThemeData,
            home: _introductionStore.checkIfIntroductionIsDone
                ? _profileStore.profileInputDone
                    ? const HomeScreen()
                    : const ProfileScreen()
                : const Introduction(),
            routes: Routes.routes,
            supportedLocales: const [
              Locale('en'),
            ],
            localizationsDelegates: const [
              FormBuilderLocalizations.delegate,
            ],
            // locale: Locale(_languageStore.locale),
          );
        },
      ),
    );
  }
}
