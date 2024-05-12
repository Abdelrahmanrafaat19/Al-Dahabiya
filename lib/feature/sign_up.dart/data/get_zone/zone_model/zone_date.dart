class ZoneData {
  int? id;
  String? name;

  ZoneData({this.id, this.name});

  ZoneData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
