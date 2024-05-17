import 'package:dio/dio.dart';

import 'package:secondwork/core/constant/constant.dart';

class ApiServer {
  Dio dio;
  ApiServer(this.dio);
  Future<dynamic> postMethod(
      {required String endPoint,
      required Map<String, dynamic> data,
      String? token}) async {
    var response = await dio.post(
      "$baseUrl/$endPoint",
      data: data,
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }),
    );
    print(
        "This is From PostMethod ${response.data}     ${response.statusCode}");
    return response.data;
  }

  Future<Map<String, dynamic>> getMethod(
      {required String endPoint,
      Map<String, dynamic>? data,
      String? token,
      String? local}) async {
    var response = await dio.get(
      "$baseUrl/$endPoint",
      data: data,
      options:
          Options(headers: {'Authorization': 'Bearer $token', "locale": local}),
    );
    print("This is From PostMethod ${response.data}");
    return response.data;
  }
}
