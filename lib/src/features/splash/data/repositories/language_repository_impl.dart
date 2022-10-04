import 'package:flutter_clean_architecture_ismail/src/core/errors/exceptions.dart';
import 'package:flutter_clean_architecture_ismail/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/data/data_sources/local_data_source/lanuage_local_data_source.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/domain/repositories/language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final LanaugeLocalDataSource _localDataSource;

  LanguageRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, bool>> changeLanguage(String languageCode) async {
    try {
      final status = await _localDataSource.changeLanauge(languageCode);
      return Right(status);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getLastSavedLanguage() async {
    try {
      final languageCode = await _localDataSource.getLastSavedLanguage();
      return Right(languageCode);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
