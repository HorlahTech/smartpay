import 'package:dio/dio.dart';
import 'package:smartpay/models/errors/error_model.dart';
import 'package:smartpay/network_helper.dart/api_error.dart';
import 'package:smartpay/utils/secure_storage.dart';

enum RequestMethod { get, post, put, patch, delete }

class DioClient {
  DioClient._();
  static Dio get _dioInstance {
    final _dio = Dio(BaseOptions(
        baseUrl: 'https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1'));
    _dio.interceptors.add(AuthInterceptor());
    return _dio;
  }

  static Future<Response<dynamic>?>? apiCall({
    required String apiPath,
    dynamic data,
    Map<String, dynamic> quaryParameters = const {},
    Map<String, dynamic> extra = const {},
    required RequestMethod method,
  }) async {
    Response? response;
    try {
      switch (method) {
        case RequestMethod.post:
          response = await _dioInstance.post(apiPath,
              data: data, queryParameters: quaryParameters);
          break;
        case RequestMethod.get:
          response = await _dioInstance.get(apiPath,
              data: data, queryParameters: quaryParameters);
          break;
        case RequestMethod.put:
          response = await _dioInstance.put(apiPath,
              data: data, queryParameters: quaryParameters);
          break;
        case RequestMethod.delete:
          response = await _dioInstance.delete(apiPath,
              data: data, queryParameters: quaryParameters);
          break;
        case RequestMethod.patch:
          response = await _dioInstance.patch(
            apiPath,
            data: data,
            queryParameters: quaryParameters,
          );
          break;
        default:
      }
    } on DioException catch (exception) {
      final exceptionMessage = await Future.error(ApiError.fromDio(exception));

      throw exceptionMessage;
    } catch (exception) {
      rethrow;
    }
    return response;
  }
}

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await SecureStorage.getToken;
    if (token != "" && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
      // print(token);
    }
    // options.headers['Content-Type'] = 'multipart/form-data';
    // options.headers["Accept"] = "application/json";
    // options.headers["Content-Type"] = "application/json";
    options.headers["Content-Type"] = "application/x-www-form-urlencoded";

    super.onRequest(options, handler);
  }
}
