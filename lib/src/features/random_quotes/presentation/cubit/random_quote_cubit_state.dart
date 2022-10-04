part of 'random_quote_cubit_cubit.dart';

abstract class RandomQuoteCubitStates extends Equatable {
  const RandomQuoteCubitStates();

  @override
  List<Object> get props => [];
}

class RandomQuoteCubitInitialState extends RandomQuoteCubitStates {}

class RandomQuoteCubitLoadingState extends RandomQuoteCubitStates {}

class RandomQuoteCubitSuccessState extends RandomQuoteCubitStates {
  final Quote quote;

  const RandomQuoteCubitSuccessState(this.quote);

  @override
  List<Object> get props => [quote];
}

class RandomQuoteCubitErrorState extends RandomQuoteCubitStates {
  final String msg;

  const RandomQuoteCubitErrorState(this.msg);

  @override
  List<Object> get props => [msg];
}
