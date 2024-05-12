class BrandData {
  int? id;
  String? name;
  String? image;

  BrandData({this.id, this.name, this.image});

  BrandData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
