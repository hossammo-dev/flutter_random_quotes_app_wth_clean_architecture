
import 'package:flutter_clean_architecture_ismail/app_prefs.dart';
import 'package:flutter_clean_architecture_ismail/src/core/errors/exceptions.dart';
import 'package:flutter_clean_architecture_ismail/src/core/json/json_handler.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/data/models/quote_model.dart';

abstract class LocalDataSource {
  Future<QuoteModel> getLastCachedQuote();
  Future<void> cacheQuote(QuoteModel quoteModel);
}

class LocalDataSourceImpl implements LocalDataSource {
  final AppPreference _appPreference;

  LocalDataSourceImpl(this._appPreference);

  @override
  Future<QuoteModel> getLastCachedQuote() {
    try {
      final jsonResponse = _appPreference.get(lastCachedQuoteKey);
      return Future.value(
          QuoteModel.fromJson(JsonHandler.decodeJson(jsonResponse)));
    } catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quoteModel) async => await _appPreference
      .save(lastCachedQuoteKey, JsonHandler.encodeJson(quoteModel));
}
