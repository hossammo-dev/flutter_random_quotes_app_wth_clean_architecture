import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_ismail/src/core/errors/failures.dart';

import '../entities/quote.dart';

abstract class Repository{
  Future<Either<Failure, Quote>> getRandomQuote();
}