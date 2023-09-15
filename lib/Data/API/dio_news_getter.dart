import 'package:dio/dio.dart';
import 'package:flutter_app/constants/strings.dart';

class DioNewsGetter {
  late Dio dio;

  DioNewsGetter() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10));
    dio = Dio(options);
  }

  Future<List<dynamic>> newsGetter() async {
    Response response = await dio.get('');
    Map<String, dynamic> result = response.data;
    return result['articles'];
  }
}
