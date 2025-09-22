class CarPartsCategoryModel {
  int? id;
  String? name;
  List<String>? photos;

  CarPartsCategoryModel({this.id, this.name, this.photos});

  CarPartsCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photos = json['photos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photos'] = photos;
    return data;
  }
}
