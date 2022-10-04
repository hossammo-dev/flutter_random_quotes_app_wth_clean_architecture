import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/domain/use_cases/get_random_quote_use_case.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/presentation/cubit/random_quote_cubit_cubit.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter_clean_architecture_ismail/src/injector.dart' as di;

import '../../core/utils/strings_manager.dart';
import '../../features/random_quotes/presentation/screens/quote_screen.dart';

class RoutesManager {
  static const String initialRoute = "/";
  static const String randomQuoteRoute = "/random_quote";
}

class RoutesGenerator {
  static Route? generate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RoutesManager.randomQuoteRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                RandomQuoteCubit(di.instance<GetRandomQuoteUseCase>()),
            child: const QuoteScreen(),
          ),
        );

      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() => MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text(AppStrings.noRoutesFound),
          ),
        ),
      );
}
