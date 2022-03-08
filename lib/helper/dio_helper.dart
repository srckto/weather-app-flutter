import 'package:dio/dio.dart';
import 'package:weather_app/constant.dart';

class DioHelper {
  late Dio _dio;

  DioHelper._() {
    init();
  }
  static final instance = DioHelper._();

  void init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: k_baseUrl,
      receiveDataWhenStatusError: true,
    );
    _dio = Dio(baseOptions);
  }


  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(endPoint, queryParameters: query);
  }
}
