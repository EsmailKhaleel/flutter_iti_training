import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio();
  Future<Response> getProducts() async {
    return await _dio.get("https://dummyjson.com/products");
  }
}
