import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grabclone/dio/dio_client.dart';
import 'package:grabclone/models/ApiResponse.dart';

class DioHelper {
  final Dio dio = DioClient().init();
  final String baseUrl = DioClient().baseUrl;

  Future<Response> get(String url) async {
    try {
      final Response response = await dio.get(baseUrl + '/api' + url);
      // final Response apiResponse = ApiResponse.fromJson(response.data);
      // if (apiResponse.status != 200) {
      //   throw Exception(apiResponse.message);
      // }
      // return apiResponse.data;
      return response;
    } on DioError catch (e) {
      // debugging purpose
      print('[Dio Helper - GET] Connection Exception => ' + e.message);
      throw e;
    }
  }

  Future<dynamic> post(String url,
      {required Map<String, dynamic> headers, @required data, encoding}) async {
    try {
      final response = await dio.post(baseUrl + "/api" + url,
          data: data, options: Options(headers: headers));
      ApiResponse apiResponse = ApiResponse.fromJson(response.data);
      if (apiResponse.status != 200) {
        throw Exception(apiResponse.message);
      }
      return apiResponse.data;
    } on DioError catch (e) {
      // debugging purpose
      print('[Dio Helper - GET] Connection Exception => ' + e.message);
      throw e;
    }
  }
}
