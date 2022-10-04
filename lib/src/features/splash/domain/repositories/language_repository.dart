import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_ismail/src/core/errors/failures.dart';

abstract class LanguageRepository {
  Future<Either<Failure, String>> getLastSavedLanguage();
  Future<Either<Failure, bool>> changeLanguage(String languageCode);
}
