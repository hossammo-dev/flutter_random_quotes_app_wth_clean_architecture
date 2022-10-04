import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_ismail/src/core/errors/failures.dart';
import 'package:flutter_clean_architecture_ismail/src/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_ismail/src/core/utils/strings_manager.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/domain/entities/quote.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/domain/use_cases/get_random_quote_use_case.dart';

part 'random_quote_cubit_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteCubitStates> {
  final GetRandomQuoteUseCase _getRandomQuoteUseCase;
  RandomQuoteCubit(this._getRandomQuoteUseCase)
      : super(RandomQuoteCubitInitialState());

  // static RandomQuoteCubit get(context) => BlocProvider.of(context);

  Future<void> getRandomQuote() async {
    emit(RandomQuoteCubitLoadingState());
    Either<Failure, Quote> response = await _getRandomQuoteUseCase(NoParams());
    emit(response.fold(
        (failure) => RandomQuoteCubitErrorState(_failureToMsg(failure)),
        (quote) => RandomQuoteCubitSuccessState(quote)));
  }
}

String _failureToMsg(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppStrings.serverError;

    case CacheFailure:
      return AppStrings.cacheError;

    default:
      return AppStrings.unexpectedError;
  }
}
