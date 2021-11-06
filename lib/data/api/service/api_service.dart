

import 'package:dio/dio.dart';

mixin HttpService {

  static const BASE_URL = 'http://api.weatherapi.com/v1/';

  static final Dio _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  static Dio get dio => _dio;
}
