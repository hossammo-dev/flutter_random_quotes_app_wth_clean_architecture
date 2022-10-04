import 'package:flutter_clean_architecture_ismail/src/core/api/api_consumer.dart';
import 'package:flutter_clean_architecture_ismail/src/core/api/api_endpoints.dart';

import '../../models/quote_model.dart';

abstract class RemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiConsumer _apiConsumer;

  RemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await _apiConsumer.get(ApiEndpoints.randomQuote);
    return QuoteModel.fromJson(response);
  }
}
