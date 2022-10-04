import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_ismail/src/core/errors/failures.dart';
import 'package:flutter_clean_architecture_ismail/src/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/domain/entities/quote.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/domain/repositories/quote_repository.dart';

class GetRandomQuoteUseCase implements UseCase<Quote, NoParams> {
  final Repository _repository;

  GetRandomQuoteUseCase(this._repository);
  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      _repository.getRandomQuote();
}
