class CityData {
  int? id;
  String? name;
  int? shippingCost;

  CityData({this.id, this.name, this.shippingCost});

  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shippingCost = json['shipping_cost'];
  }
}
