class Data {
  int? id;
  Null link;
  String? image;

  Data({this.id, this.link, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    image = json['image'];
  }
}
