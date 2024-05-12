class SectionData {
  int? id;
  Null parentId;
  String? name;
  String? image;

  SectionData({this.id, this.parentId, this.name, this.image});

  SectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    image = json['image'];
  }
}
