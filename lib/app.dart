import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_clean_architecture_ismail/src/config/locale/app_localizations_setup.dart';
import 'package:flutter_clean_architecture_ismail/src/config/routes/routes_manager.dart';
import 'package:flutter_clean_architecture_ismail/src/config/themes/app_theme.dart';
import 'package:flutter_clean_architecture_ismail/src/core/utils/strings_manager.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/presentation/cubit/locale_cubit.dart';
import 'src/injector.dart' as di;

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.instance<LocaleCubit>()..getLastSavedLanuage(),
      child: BlocBuilder<LocaleCubit, LocaleStates>(
        buildWhen: (previousState, currentStatet) {
          return previousState != currentStatet;
        },
        builder: (context, state) {
          return MaterialApp(
            title: AppStrings.quotesApp,
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            onGenerateRoute: RoutesGenerator.generate,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            locale: state.locale,
          );
        },
      ),
    );
  }
}
