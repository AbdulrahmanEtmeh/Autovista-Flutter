class CarPartsCategoryModel {
  int? id;
  String? name;
  List<String>? photos;

  CarPartsCategoryModel({this.id, this.name, this.photos});

  CarPartsCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    final imagesRaw = json['images'] ?? json['photos'];
    if (imagesRaw is List) {
      photos = imagesRaw.map((e) => e.toString()).toList();
    } else {
      photos = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['images'] = photos;
    return data;
  }
}
