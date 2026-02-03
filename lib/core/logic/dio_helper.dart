import 'package:dio/dio.dart';


enum DataState { loading, failed, success }

class DioHelper {
  static const _baseURL = "http://www.cosmatics.growfet.com/";
  static final _dio = Dio(
    BaseOptions(
      baseUrl: _baseURL,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  static Future<CustomResponse?> sendData({
    String path = "",
    Map<String, dynamic>? data,
  }) async {
    try {
      final resp = await _dio.post(path, data: data);

      if (resp.statusCode == 200) {
        return CustomResponse(isSuccess: true, data: resp.data);
      }

      return CustomResponse(isSuccess: false);
    } on DioException catch (ex) {
      if (ex.response?.data != null && ex.response?.data is Map) {}
      return CustomResponse(isSuccess: false, data: ex.response?.data);
      // ex.response?.data["message"]
    }
  }

  static Future<CustomResponse?> getData(
    String path, {
    Map<String, dynamic>? queryParametes,
  }) async {
    try {
      final resp = await _dio.get(path, queryParameters: queryParametes);
      if (resp.statusCode == 200) {
        return CustomResponse(isSuccess: true, data: resp.data);
      }

      return CustomResponse(isSuccess: false, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponse(isSuccess: false, data: ex.response?.data);
      // ex.response?.data["message"]
    }
  }
}

class CustomResponse {
  final bool isSuccess;
  final data;
  late final String? msg;

  CustomResponse({required this.isSuccess, this.data}) {
    msg = data is Map ? data['message'] : null;
  }
}
