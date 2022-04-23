import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

import '../../config/apis/apis.dart';

class BaseApiProvider {
  final Map? options;

  BaseApiProvider({Key? key, this.options});

  Dio get backendApiReq {
    BaseOptions options = BaseOptions(
      baseUrl: BackendApi.baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 15000,
      validateStatus: (status) => status! < 700, // TODO
    );

    Dio dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Content-Type'] = 'application/json';

          return handler.next(options);
        },
        onResponse: (response, handler) {
          try {
            logger.d(response.data.runtimeType);
          } catch (e) {
            logger.d(runtimeType, '${e.runtimeType}::${e.toString()}');

            throw DioError(
              requestOptions: response.requestOptions,
              error: e,
            );
          }
          handler.next(response);
        },
        onError: (DioError e, handler) {
          final _path = e.requestOptions.path;
          logger.w('HTTP request/response error! {Path: $_path}', e);

          handler.next(e);
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true, request: true),
    );

    return dio;
  }
}
