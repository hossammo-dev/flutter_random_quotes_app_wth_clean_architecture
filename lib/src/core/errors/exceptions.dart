import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? msg;

  const ServerException([this.msg]);
  @override
  List<Object?> get props => [msg];

  @override
  String toString() => "$msg";
}

class FetchDataException extends ServerException {
  const FetchDataException([msg]) : super("Error During Communication");
}

class BadRequestException extends ServerException {
  const BadRequestException([msg]) : super("Bad Request");
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([msg]) : super("Unauthorized");
}

class NotFoundException extends ServerException {
  const NotFoundException([msg]) : super("Requested Info Not Found");
}

class ConflictException extends ServerException {
  const ConflictException([msg]) : super("Conflict Occurred");
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([msg]) : super("Internal Server Error");
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([msg]) : super("No Internet Connection");
}

class CacheException implements Exception {}
