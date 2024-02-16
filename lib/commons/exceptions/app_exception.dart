class AppException implements Exception {
  final String message;

  AppException({required this.message});
  @override
  String toString() {
    return 'message=$message';
  }
}

class BadRequestException extends AppException {
  BadRequestException({required String message}) : super(message: message);
}

class GeneralException extends AppException {
  GeneralException({required String message}) : super(message: message);
}

class OfflineException extends AppException {
  OfflineException({required String message}) : super(message: message);
}

class ServerException extends AppException {
  ServerException({required String message}) : super(message: message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException({required String message}) : super(message: message);
}
