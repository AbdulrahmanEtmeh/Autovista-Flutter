enum VehicleStyle {
  coupe(title: 'coupe'),
  convertible(title: 'convertible'),
  sedan(title: 'sedan'),
  wagon(title: 'wagon'),
  hatchback(title: 'hatchback');

  const VehicleStyle({required this.title});
  final String title;
}

class CarCategoriesModel {
  int? id;
  String? name;

  CarCategoriesModel({this.id, this.name});

  CarCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
