import 'dart:async';
import 'package:cybernate_retail_mobile/data/repository.dart';
import 'package:cybernate_retail_mobile/dependency_injection/components/services.dart';
import 'package:cybernate_retail_mobile/global_theme/apptheme.dart';
import 'package:cybernate_retail_mobile/routes/routes.dart';
import 'package:cybernate_retail_mobile/stores/introduction/introduction.dart';
import 'package:cybernate_retail_mobile/stores/language/language.dart';
import 'package:cybernate_retail_mobile/stores/profile/profile.dart';
import 'package:cybernate_retail_mobile/stores/theme/theme.dart';
import 'package:cybernate_retail_mobile/ui/home/home.dart';
import 'package:cybernate_retail_mobile/ui/introduction/introduction.dart';
import 'package:cybernate_retail_mobile/ui/profile/profile.dart';
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
            title: 'cybernate-retail',
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
