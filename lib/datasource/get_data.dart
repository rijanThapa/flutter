import 'package:dio/dio.dart';

abstract class GetData {
  Dio dio = Dio();
  Future<dynamic> getData();
}

class GetDataImpl extends GetData {
  @override
  Future<List<dynamic>> getData() async {
    try {
      final response = await dio.get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
