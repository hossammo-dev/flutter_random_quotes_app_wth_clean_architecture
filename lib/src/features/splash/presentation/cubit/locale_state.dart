part of 'locale_cubit.dart';

abstract class LocaleStates extends Equatable {
  final Locale locale;
  const LocaleStates(this.locale);

  @override
  List<Object> get props => [locale];
}

class LocaleInitialState extends LocaleStates {
  const LocaleInitialState(Locale selectedLanguage) : super(selectedLanguage);
}

// get saved language
class LocaleGetLastSavedLanuageState extends LocaleStates {
  const LocaleGetLastSavedLanuageState(Locale locale) : super(locale);
}

//change current language
class LocaleChangeLanuageState extends LocaleStates {
  const LocaleChangeLanuageState(Locale locale) : super(locale);
}
