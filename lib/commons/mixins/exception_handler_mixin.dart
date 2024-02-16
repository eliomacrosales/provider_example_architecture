import 'dart:async';
import 'dart:io';
import 'package:bac_architecture/commons/exceptions/app_exception.dart';
import 'package:dio/dio.dart';
import '../network_connection/models/response_api.dart';
import 'package:bac_architecture/commons/network_connection/network_service.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<ResponseApi> handleException<T extends Object>(
      Future<Response<dynamic>> Function() handler,
      {String endpoint = ''}) async {
    try {
      final res = await handler();
      return ResponseApi(statusCode: res.statusCode ?? 200, data: res.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw _handleGenericError(e);
    }
  }

  AppException _handleDioError(DioException e) {
    if (e.response != null) {
      return _processApplicationError(e.response!.statusCode);
    } else {
      return AppException(message: 'Unable to connect to the server.');
    }
  }

  AppException _handleGenericError(dynamic e) {
    final Map<Type, String> errorMessages = {
      SocketException: 'Unable to connect to the server.',
    };

    return AppException(
        message: errorMessages[e.runtimeType] ?? 'Unknown error occurred');
  }

  AppException _processApplicationError(int? statusCode) {
    final Map<int, AppException> errorMap = {
      HttpStatus.badRequest: BadRequestException(message: 'Solicitud incorrecta'),
      HttpStatus.unauthorized: UnauthorizedException(message: 'No autorizado'),
      HttpStatus.notFound: GeneralException(message: 'Recurso no encontrado'),
      HttpStatus.internalServerError: ServerException(message: 'Error del servidor'),
    };
    return errorMap[statusCode ?? 500] ?? GeneralException(message: 'Error desconocido');
  }
}
