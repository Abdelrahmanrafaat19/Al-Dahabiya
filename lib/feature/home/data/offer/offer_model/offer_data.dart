class OfferData {
  dynamic id;
  String? name;
  String? image;

  OfferData({this.id, this.name, this.image});

  OfferData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
