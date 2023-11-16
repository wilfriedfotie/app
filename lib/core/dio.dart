import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'const.dart';

class DioWrapper {
  Dio? dio;
  static DioWrapper? instance;
  static Dio getInstance() {
    if (instance == null) {
      instance = new DioWrapper();
      BaseOptions options = new BaseOptions(
          baseUrl: ConstVars.apiDevUrl,
          connectTimeout: Duration(seconds: 3),
          receiveTimeout: Duration(seconds: 3),
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          validateStatus: (status) {
            return true;
          },
          headers: {});
      instance!.dio = Dio(options);

      instance?.dio?.interceptors.add(InterceptorsWrapper(
          onRequest: requestInterceptor,
          onResponse: responseInterceptor,
          onError: errorInterceptor));
      instance?.dio?.interceptors
          .add(LogInterceptor(responseBody: true, request: true));
    }
    return instance!.dio!;
  }

  static dynamic requestInterceptor(
      RequestOptions request, RequestInterceptorHandler handler) async {
    // Do something before request is sent
    return handler.next(request); //continue
    // If you want to resolve the request with some custom data，
    // you can resolve a `Response` object eg: `handler.resolve(response)`.
    // If you want to reject the request with a error message,
    // you can reject a `DioError` object eg: `handler.reject(dioError)`
  }

  static dynamic responseInterceptor(
      Response response, ResponseInterceptorHandler handler) async {
    print("responseInterceptor");
    print(response.statusCode);
    print(response.data);
    if (response.statusCode == 401) {
      // Todo look how to make this more efficient
      // Navigator.push(_context, MaterialPageRoute(
      //     builder: (context) => LoginScreen(isFirstLogin: false)));
    }
    return handler.next(response);
    // return DioError(
    //     request: response.request, error: "User is no longer active", requestOptions: instance.dio.request(path);
  }

  static dynamic errorInterceptor(
      DioError dioError, ErrorInterceptorHandler handler) {
    print("errorInterceptor");
    // Todo uncomment that
    print(dioError.response?.data);
    return handler.next(dioError);
  }
}
