import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (kDebugMode) {
          print('🌐 dio [REQUEST] => PATH: ${options.path} | PARAMS: ${options.queryParameters}');
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          print('✅ dio [RESPONSE] => STATUS: ${response.statusCode} | PATH: ${response.requestOptions.path}');
        }
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        if (kDebugMode) {
          print('❌ dio [ERROR] => STATUS: ${error.response?.statusCode} | MSG: ${error.message}');
        }
        return handler.next(error);
      },
    ),
  );

  return dio;
});
