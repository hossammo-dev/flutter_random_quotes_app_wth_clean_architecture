import 'package:flutter_clean_architecture_ismail/app_prefs.dart';
import 'package:flutter_clean_architecture_ismail/src/core/utils/strings_manager.dart';

abstract class LanaugeLocalDataSource {
  Future<String> getLastSavedLanguage();
  Future<bool> changeLanauge(String languageCode);
}

class LanaugeLocalDataSourceImpl implements LanaugeLocalDataSource {
  final AppPreference _appPreference;

  LanaugeLocalDataSourceImpl(this._appPreference);

  @override
  Future<bool> changeLanauge(String languageCode) async =>
      _appPreference.save(AppStrings.locale, languageCode);

  @override
  Future<String> getLastSavedLanguage() async =>
      _appPreference.get(AppStrings.locale);
}
