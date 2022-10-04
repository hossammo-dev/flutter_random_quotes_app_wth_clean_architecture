import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_ismail/src/config/locale/app_localizations.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/presentation/cubit/random_quote_cubit_cubit.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/presentation/widgets/quote_container.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/presentation/cubit/locale_cubit.dart';
import '../../../../core/utils/colors/colors_manager.dart';
import '../../../../core/widgets/error_widget.dart' as error_widget;

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  Future<void> _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _getRandomQuote,
        child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    if (AppLocalizations.of(context)!.isEnLocale) {
                      BlocProvider.of<LocaleCubit>(context).toArabic();
                    } else {
                      BlocProvider.of<LocaleCubit>(context).toEnglish();
                    }
                  },
                  icon: const Icon(
                    Icons.translate,
                    color: ColorsManager.black,
                  )),
              title:
                  Text(AppLocalizations.of(context)!.translate('app_name')!)),
          body: _buildPageContent(),
        ));
  }

  Widget _buildPageContent() =>
      BlocConsumer<RandomQuoteCubit, RandomQuoteCubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RandomQuoteCubitLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RandomQuoteCubitErrorState) {
            return error_widget.ErrorWidget(
              onPress: _getRandomQuote,
            );
          } else if (state is RandomQuoteCubitSuccessState) {
            return Column(
              children: [
                QuoteContainer(quote: state.quote),
                const SizedBox(height: 15),
                InkWell(
                  onTap: _getRandomQuote,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorsManager.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.refresh,
                        size: 25, color: ColorsManager.white),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
}
