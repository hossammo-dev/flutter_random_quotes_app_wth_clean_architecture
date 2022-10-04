import 'package:shared_preferences/shared_preferences.dart';

const String lastCachedQuoteKey = "last_cached_Quote_key";

class AppPreference {
  final SharedPreferences _sharedPreferences;

  AppPreference(this._sharedPreferences);

  Future<bool> save(String key, String value) async =>
      await _sharedPreferences.setString(key, value);

  dynamic get(String key) async {
    if (_sharedPreferences.containsKey(key)) {
      _sharedPreferences.get(key);
    }
  }
}
