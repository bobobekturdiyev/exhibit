import 'package:dio/dio.dart';

class DioSettings {
  final BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: 'https://my-json-server.typicode.com/Reyst/exhibit_db/',
    connectTimeout: 35000,
    receiveTimeout: 33000,
    followRedirects: false,
    headers: {"Accept": "*/*"},
    validateStatus: (status) {
      return status != null && status <= 500;
    },
  );

  BaseOptions get dioBaseOptions => _dioBaseOptions;
}
