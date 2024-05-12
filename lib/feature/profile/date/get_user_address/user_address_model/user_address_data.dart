class UserAddressData {
  int? id;
  String? address;
  String? government;
  String? city;
  String? zone;
  int? shippingCost;

  UserAddressData(
      {this.id,
      this.address,
      this.government,
      this.city,
      this.zone,
      this.shippingCost});

  UserAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    government = json['government'];
    city = json['city'];
    zone = json['zone'];
    shippingCost = json['shipping_cost'];
  }
}
