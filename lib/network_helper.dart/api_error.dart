import 'package:dio/dio.dart';

class ApiError {
  late String? errorDescription;
  ApiError({required this.errorDescription});
  late DioException dioError;
  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  void _handleError(Object error) async {
    if (error is DioException) {
      dioError = error; // as DioError;

      switch (dioError.type) {
        case DioExceptionType.cancel:
          errorDescription = 'Request canceled';
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = 'Connection timeout';
          break;
        case DioExceptionType.unknown:
          errorDescription =
              'Something went wrong, please check your internet connection...';
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = 'Receiving timeout';
          break;
        case DioExceptionType.badResponse:
          if (dioError.response!.statusCode == 401) {
            errorDescription = error.response?.data?['message'].toString() ??
                extractDescriptionFromResponse(error.response);
          } else if (dioError.response!.statusCode == 403) {
            errorDescription = error.response?.data?['message'].toString() ??
                extractDescriptionFromResponse(dioError.response);
          } else if (dioError.response!.statusCode == 404) {
            errorDescription = error.response?.data?['message'].toString() ??
                extractDescriptionFromResponse(dioError.response);
          } else if (dioError.response!.statusCode == 409) {
            errorDescription = error.response?.data?['message'].toString() ??
                extractDescriptionFromResponse(dioError.response);
          } else if (dioError.response!.statusCode == 400) {
            errorDescription = error.response?.data?['message'].toString() ??
                extractDescriptionFromResponse(dioError.response);
          } else if (dioError.response!.statusCode == 422) {
            errorDescription = error.response?.data?['message'] ??
                extractDescriptionFromResponse(dioError.response);
          } else if (dioError.response!.statusCode == 500) {
            errorDescription = 'Internal Server Error';
          } else {
            errorDescription = extractDescriptionFromResponse(error.response);
          }

          break;
        case DioExceptionType.sendTimeout:
          errorDescription =
              'Something went wrong, please check your internet connection...';
          break;
        case DioExceptionType.badCertificate:
          errorDescription =
              'Something went wrong, please check your internet connection...';
          break;
        case DioExceptionType.connectionError:
          errorDescription =
              'Connection Error, please check your internet connection...';
          break;
      }
    } else {
      errorDescription = 'Something went wrong, please try again...';
    }
  }

  String extractDescriptionFromResponse(Response? response) {
    String? message;
    try {
      if (response?.data != null && response?.data['data']['error'] != null) {
        message = '${response!.data["data"]["error"]}';
      } else if (response?.data != null &&
          response?.data['data']['message'] != null) {
        message = '${response!.data["data"]["message"]}';
      } else if (response?.data != null && response!.data['message'] != null) {
        message = response.data['message'];
      } else if (response?.data != null && response?.data['error'] != null) {
        message = '${response?.data['error']}';
      } else {
        message = response!.statusMessage;
      }
    } catch (error) {
      message = response?.statusMessage ?? error.toString();
    }

    return message ?? 'Something went wrong';
  }

  @override
  String toString() => errorDescription == null ||
          errorDescription == 'null' ||
          errorDescription!.isEmpty
      ? extractDescriptionFromResponse(dioError.response)
      : errorDescription!;
}
