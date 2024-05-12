import 'package:secondwork/feature/order/data/all_order_model/all_order_data.dart';

class AllOrderModel {
  int? code;
  List<AllOrderData>? data;

  AllOrderModel({this.code, this.data});

  AllOrderModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <AllOrderData>[];
      json['data'].forEach((v) {
        data!.add(AllOrderData.fromJson(v));
      });
    }
  }
}
