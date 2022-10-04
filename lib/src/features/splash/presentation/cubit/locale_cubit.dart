import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_ismail/src/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/domain/use_cases/change_language.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/domain/use_cases/get_last_saved_language.dart';

import '../../../../core/utils/strings_manager.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleStates> {
  final GetLastSavedLanguageUseCase _getLastSavedLanguageUseCase;
  final ChangeLanguageUseCase _changeLanguageUseCase;

  LocaleCubit(this._getLastSavedLanguageUseCase, this._changeLanguageUseCase)
      : super(const LocaleInitialState(Locale(AppStrings.englishCode)));

  //get last saved language
  Future<void> getLastSavedLanuage() async {
    final response = await _getLastSavedLanguageUseCase(NoParams());
    response.fold(
      (failure) => debugPrint(failure.toString()),
      (languageCode) {
        emit(LocaleGetLastSavedLanuageState(Locale(languageCode)));
      },
    );
  }

  //change language
  Future<void> _changeLanguage(String lanuageCode) async {
    final response = await _changeLanguageUseCase(lanuageCode);
    response.fold(
      (failure) => debugPrint(failure.toString()),
      (_) {
        emit(LocaleChangeLanuageState(Locale(lanuageCode)));
      },
    );
  }

  void toEnglish() => _changeLanguage(AppStrings.englishCode);
  void toArabic() => _changeLanguage(AppStrings.arabicCode);
}
