import 'package:dio/dio.dart';

abstract class Failure implements Exception {
  Failure({
    this.title,
    this.code,
    this.message = 'Failure',
  });

  String? title;

  /// In case server provider error codes.
  String? code;

  /// Hold Error Message.
  String message;

  @override
  String toString() {
    return message;
  }
}

class DioFailure implements Exception {
  DioFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.badCertificate:
        message = 'bad Certificate with API server';
        break;
      case DioExceptionType.badResponse:
        message = _handleResponseError(dioError.response);
        statusCode = dioError.response?.statusCode;
        break;
      case DioExceptionType.connectionError:
      // TODO: Handle this case.
        break;
      case DioExceptionType.unknown:
        message = dioError.error?.toString() ??
            'Connection to API server failed due to internet connection';
        break;
    }
  }

  String message = 'Permintaan gagal, silahkan coba lagi atau hubungi admin';
  int? statusCode;

  String _handleResponseError(Response? res) {
    var errorMessage = message;
    try {
      if (res?.data is String) {
        errorMessage = res?.data;
      }

      if (res?.data['meta'] != null) {
        errorMessage = res!.data['meta']['message'].toString();
      }

      if (res?.data['errors'] != null) {
        errorMessage = res!.data['errors'].toString();
      }

      if (res?.data['message'] != null) {
        errorMessage = res!.data['message'].toString();
      }
    } catch (e) {
      print(e);
    }

    return errorMessage;
  }

  @override
  String toString() => message;
}

class GeneralFailure extends Failure {
  GeneralFailure({
    String? message,
  }) : super(
    message: message ?? 'General Failure',
    title: 'General Failure',
  );
}
