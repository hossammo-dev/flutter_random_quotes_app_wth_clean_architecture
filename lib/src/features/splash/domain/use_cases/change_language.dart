import 'package:flutter_clean_architecture_ismail/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_ismail/src/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/domain/repositories/language_repository.dart';

class ChangeLanguageUseCase implements UseCase<bool, String> {
  final LanguageRepository _repository;

  ChangeLanguageUseCase(this._repository);
  @override
  Future<Either<Failure, bool>> call(String languageCode) async =>
      _repository.changeLanguage(languageCode);
}
