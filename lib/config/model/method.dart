// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';

class Method {
  static const String get = "GET";
  static const String post = "POST";
  static const String put = "PUT";
  static const String head = "HEAD";
  static const String delete = "DELETE";
  static const String patch = "PATCH";
}

class DioClient {
  static final Dio _myDio = Dio(getDefOptions());
  static bool _isDebug = false;

  static String Function(dynamic) onErrorHandle = (dynamic responseData) {
    if (responseData == null || responseData is! Map<String, dynamic>) {
      
    }
    return responseData['error'].toString();
  };

  /// get Def Options.
  static BaseOptions getDefOptions() {
    BaseOptions options = BaseOptions();
    options.contentType = ContentType.parse("application/json").toString();
    options.connectTimeout = 1000 * 10;
    options.receiveTimeout = 1000 * 8;
    return options;
  }



  static void setClientAdapter(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
       
        return true;
      };
      return client;
    };
  }

  static void updateBaseUrl(Dio dio, Uri uri) {
    dio.options.baseUrl = uri.toString();
   
    setClientAdapter(dio);
  }

  static void updateTimeOut(Dio dio,
      {int connectTimeOut = 12000, int receiveTimeout = 9000}) {
    dio.options.connectTimeout = connectTimeOut;
    dio.options.receiveTimeout = receiveTimeout;
  }

  static void updateHeader(Dio dio, Map<String, String> headers) {
    Map<String, dynamic> curHeaders = dio.options.headers;
    headers.forEach((key, value) {
      curHeaders[key] = value;
    });
    dio.options.headers = curHeaders;
  }

  static void setCookie(Dio dio, String cookie) {
    Map<String, dynamic> headers = <String, dynamic>{};
    headers["Cookie"] = cookie;
    dio.options.headers.addAll(headers);
  }

  /// Enable debug
  static void setDebugMode(bool isEnabled) {
    _isDebug = isEnabled;
  }

  /// Decode response data.
  static Map<String, dynamic> decodeData(Response? response) {
    if (response == null ||
        response.data == null ||
        response.data.toString().isEmpty) {
      return <String, dynamic>{};
    }
    return json.decode(response.data.toString()) as Map<String, dynamic>;
  }


  static void clearInterceptors(Dio dio) {
    dio.interceptors.clear();
  }
}
