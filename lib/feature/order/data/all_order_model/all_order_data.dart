import 'package:secondwork/feature/order/data/all_order_model/all_order_sub_field.dart';

class AllOrderData {
  int? id;
  String? paymentType;
  double? total;
  int? shipping;
  String? date;
  String? orderCurrency;
  String? status;
  int? statusChange;
  List<AllStatus>? allStatus;
  int? usePoints;
  String? points;
  int? pointPrice;
  List<Products>? products;

  AllOrderData(
      {this.id,
      this.paymentType,
      this.total,
      this.shipping,
      this.date,
      this.orderCurrency,
      this.status,
      this.statusChange,
      this.allStatus,
      this.usePoints,
      this.points,
      this.pointPrice,
      this.products});

  AllOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentType = json['payment_type'];
    total = json['total'];
    shipping = json['shipping'];
    date = json['date'];
    orderCurrency = json['order_currency'];
    status = json['status'];
    statusChange = json['status_change'];
    if (json['allStatus'] != null) {
      allStatus = <AllStatus>[];
      json['allStatus'].forEach((v) {
        allStatus!.add(new AllStatus.fromJson(v));
      });
    }
    usePoints = json['use_points'];
    points = json['points'];
    pointPrice = json['point_price'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }
}
