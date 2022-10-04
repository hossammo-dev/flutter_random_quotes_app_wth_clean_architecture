import 'package:flutter_clean_architecture_ismail/src/core/errors/exceptions.dart';
import 'package:flutter_clean_architecture_ismail/src/core/network/network_info.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/data/data_sources/local_data_source/local_data_source.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/domain/entities/quote.dart';
import 'package:flutter_clean_architecture_ismail/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/domain/repositories/quote_repository.dart';

class RepositoryImpl implements Repository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  RepositoryImpl(
      this._networkInfo, this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await _networkInfo.isConnected()) {
      //get quote from remote
      try {
        final response = await _remoteDataSource.getRandomQuote();
        await _localDataSource.cacheQuote(response);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      //get cached quote
      try {
        final response = await _localDataSource.getLastCachedQuote();
        return Right(response);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
