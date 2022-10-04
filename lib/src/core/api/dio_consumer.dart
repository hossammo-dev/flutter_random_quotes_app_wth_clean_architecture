import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture_ismail/src/core/api/api_consumer.dart';
import 'package:flutter_clean_architecture_ismail/src/core/api/api_endpoints.dart';
import 'package:flutter_clean_architecture_ismail/src/core/api/api_interceptors.dart';
import 'package:flutter_clean_architecture_ismail/src/core/api/api_status_code.dart';
import 'package:flutter_clean_architecture_ismail/src/core/errors/exceptions.dart';
import 'package:flutter_clean_architecture_ismail/src/core/json/json_handler.dart';
import '../../injector.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio _dio;

  DioConsumer(this._dio) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio.options
      ..baseUrl = baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < ApiStatusCode.internalServerError;
      };
    _dio.interceptors.add(di.instance<ApiInterceptors>());
    if (kDebugMode) {
      _dio.interceptors.add(di.instance<LogInterceptor>());
    }
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? params}) async {
    try {
      final response =
          await _dio.delete(path, queryParameters: params, data: body);
      return JsonHandler.decodeJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(path, queryParameters: params);
      return JsonHandler.decodeJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    bool isFormDataEnabled = false,
  }) async {
    try {
      final response = await _dio.post(path,
          queryParameters: params,
          data: isFormDataEnabled ? FormData.fromMap(body!) : body);
      return JsonHandler.decodeJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? params}) async {
    try {
      final response =
          await _dio.put(path, queryParameters: params, data: body);
      return JsonHandler.decodeJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }
}

dynamic _handleDioError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      throw const FetchDataException();

    case DioErrorType.response:
      switch (error.response?.statusCode) {
        case ApiStatusCode.badRequest:
          throw const BadRequestException();
        case ApiStatusCode.unauthorized:
        case ApiStatusCode.forbidden:
          throw const UnauthorizedException();
        case ApiStatusCode.notFound:
          throw const NotFoundException();
        case ApiStatusCode.confilct:
          throw const ConflictException();

        case ApiStatusCode.internalServerError:
          throw const InternalServerErrorException();
      }
      break;

    case DioErrorType.cancel:
      break;

    case DioErrorType.other:
      return const NoInternetConnectionException();
  }
}
