import 'package:flutter_clean_architecture_ismail/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_ismail/src/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/domain/repositories/language_repository.dart';

class GetLastSavedLanguageUseCase implements UseCase<String, NoParams> {
  final LanguageRepository _repository;

  GetLastSavedLanguageUseCase(this._repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      _repository.getLastSavedLanguage();
}
