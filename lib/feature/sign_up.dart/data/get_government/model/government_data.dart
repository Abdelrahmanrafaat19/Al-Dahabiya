class DataGovernment {
  int? id;
  String? name;

  DataGovernment({this.id, this.name});

  DataGovernment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
