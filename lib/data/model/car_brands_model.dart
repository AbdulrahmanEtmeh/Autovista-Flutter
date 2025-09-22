enum Brands {
  audi(title: 'audi'),
  bmw(title: 'bmw'),
  chevy(title: 'chevy'),
  chrysler(title: 'chrysler'),
  ford(title: 'ford'),
  honda(title: 'honda'),
  hyundai(title: 'hyundai'),
  jeep(title: 'jeep'),
  mazda(title: 'mazda'),
  mercedes(title: 'mercedes-benz'),
  nissan(title: 'nissan'),
  toyota(title: 'toyota'),
  volvo(title: 'volvo');

  const Brands({required this.title});
  final String title;
}

class CarBrandsModel {
  int? id;
  String? name;
  List<String>? photos;

  CarBrandsModel({this.id, this.name, this.photos});

  CarBrandsModel.fromJson(Map<String, dynamic> json) {
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
