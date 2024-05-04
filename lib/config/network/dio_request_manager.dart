
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:news/config/contans/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'i_api_request_manager.dart';

class DioHttpClient extends IHttpClient {
  final _timeout = const Duration(seconds: 30);
  late Dio _dio;
  BaseOptions? options;
  final String baseUrl = Constants.baseUrl; //server url

  final bool logEnabled;
  bool lockRequest = false;

  DioHttpClient({this.logEnabled = kDebugMode}) {
    options = dioOption();
    _dio = Dio(options);

    setInterceptor();
    if (logEnabled) {
      _dio.interceptors.add(CurlLoggerDioInterceptor());
      _dio.interceptors.add(prettyDioLogger());
    }
  }

  void setInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) async {
          return handler.next(options);
        },
        onResponse: (Response response, handler) async {
          return handler.next(response);
        },
        onError: (DioException err, handler) async {
          switch (err.type) {
            case DioExceptionType.receiveTimeout:
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.sendTimeout:
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
            case DioExceptionType.unknown:
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
            case DioExceptionType.cancel:
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
            case DioExceptionType.badResponse:
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
            case DioExceptionType.badCertificate:
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
            case DioExceptionType.connectionError:
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
          }
        },
      ),
    );
  }

  Interceptor prettyDioLogger() {
    return PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90);
  }

  BaseOptions dioOption() {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
      sendTimeout: _timeout,
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'accept-charset': 'UTF-8',
      },
    );
  }

  Future retry(RequestOptions requestOptions) async {
    final options = Options(method: requestOptions.method);
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  DioException? handleResponseError(DioException e) {
    try {
      if (e.response?.data["code"] == 'token_not_invalid' ||
          e.response?.data["code"] == 'access_token_invalid') {
        //to log out user and delete access token
      } else if (e.response?.data["code"] == 'refresh_token_invalid') {
        //to log out user and delete refresh token
      }

      return DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        error: e.response!.data["messages"],
      );
    } catch (er) {
      // response code translate could be here and throw new DioException
      if (kDebugMode) {
        print(er.runtimeType);
      }
      return DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        error: /*e.response!.data["message"]*/ "Error on connecting to Server",
      );
    }
  }

  @override
  Future deleteRequest({
    required String path,
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Dio? dio,
  }) async {
    try {
      if (dio != null) {
        _dio = dio;
      }
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future getRequest(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future patchRequest(
      {required String path,
      data,
      Map<String, String>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future postRequest(
      {required String path,
      data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future uploadRequest(
      {required String path,
      data,
      Map<String, String>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future putRequest(
      {required String path,
      data,
      Map<String, String>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }
}
