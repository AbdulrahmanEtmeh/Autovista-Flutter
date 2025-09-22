// class CarModel {
//   int? id;
//   String? name;
//   int? price;
//   double? rating;
//   int? space;
//   int? capacity;
//   String? gearType;
//   int? consumption;
//   String? color;
//   String? date;
//   String? brand;
//   String? style;
//   List<String>? photos;
//   String? createdAt;
//   String? updatedAt;

//   CarModel(
//       {this.id,
//       this.name,
//       this.price,
//       this.rating,
//       this.space,
//       this.capacity,
//       this.gearType,
//       this.consumption,
//       this.color,
//       this.date,
//       this.brand,
//       this.style,
//       this.photos,
//       this.createdAt,
//       this.updatedAt});

//   CarModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     price = json['price'];
//     rating = json['rating']?.toDouble();
//     space = json['space'];
//     capacity = json['capacity'];
//     gearType = json['gear_type'];
//     consumption = json['consumption'];
//     color = json['color'];
//     date = json['date'];
//     brand = json['brand'];
//     style = json['style'];
//     photos = json['photos'].cast<String>();
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['price'] = price;
//     data['rating'] = rating;
//     data['space'] = space;
//     data['capacity'] = capacity;
//     data['gear_type'] = gearType;
//     data['consumption'] = consumption;
//     data['color'] = color;
//     data['date'] = date;
//     data['brand'] = brand;
//     data['style'] = style;
//     data['photos'] = photos;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

// class CarModel {
//   int? id;
//   String? name;
//   int? price;
//   double? rating;
//   int? space;
//   int? capacity;
//   String? gearType;
//   int? consumption;
//   String? color;
//   String? date;
//   String? brand;
//   String? style;
//   List<String>? photos;
//   int? isFavorite;
//   String? createdAt;
//   String? updatedAt;

//   CarModel(
//       {this.id,
//       this.name,
//       this.price,
//       this.rating,
//       this.space,
//       this.capacity,
//       this.gearType,
//       this.consumption,
//       this.color,
//       this.date,
//       this.brand,
//       this.style,
//       this.photos,
//       this.isFavorite,
//       this.createdAt,
//       this.updatedAt});

//   CarModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     price = json['price'];
//     rating = json['rating']?.toDouble();
//     space = json['space'];
//     capacity = json['capacity'];
//     gearType = json['gear_type'];
//     consumption = json['consumption'];
//     color = json['color'];
//     date = json['date'];
//     brand = json['brand'];
//     style = json['style'];
//     photos = json['photos'].cast<String>();
//     isFavorite = json['is_favorite'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['price'] = price;
//     data['rating'] = rating;
//     data['space'] = space;
//     data['capacity'] = capacity;
//     data['gear_type'] = gearType;
//     data['consumption'] = consumption;
//     data['color'] = color;
//     data['date'] = date;
//     data['brand'] = brand;
//     data['style'] = style;
//     data['photos'] = photos;
//     data['is_favorite'] = isFavorite;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

class CarModel {
  int? id;
  String? name;
  int? price;
  double? rating;
  int? space;
  int? capacity;
  String? gearType;
  int? consumption;
  String? color;
  String? date;
  String? brand;
  String? style;
  List<String>? photos;
  int? isFavorite;
  String? createdAt;
  String? updatedAt;

  CarModel({
    this.id,
    this.name,
    this.price,
    this.rating,
    this.space,
    this.capacity,
    this.gearType,
    this.consumption,
    this.color,
    this.date,
    this.brand,
    this.style,
    this.photos,
    this.isFavorite,
    this.createdAt,
    this.updatedAt,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      name: json['name'],
      price:
          json['price'] != null ? int.tryParse(json['price'].toString()) : null,
      rating: json['rating'] != null
          ? double.tryParse(json['rating'].toString())
          : null,
      space:
          json['space'] != null ? int.tryParse(json['space'].toString()) : null,
      capacity: json['capacity'] != null
          ? int.tryParse(json['capacity'].toString())
          : null,
      gearType: json['gear_type'],
      consumption: json['consumption'] != null
          ? int.tryParse(json['consumption'].toString())
          : null,
      color: json['color'],
      date: json['date'],
      brand: json['brand'],
      style: json['style'],
      photos: json['photos'] != null ? List<String>.from(json['photos']) : null,
      isFavorite: json['is_favorite'] != null
          ? int.tryParse(json['is_favorite'].toString())
          : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['rating'] = rating;
    data['space'] = space;
    data['capacity'] = capacity;
    data['gear_type'] = gearType;
    data['consumption'] = consumption;
    data['color'] = color;
    data['date'] = date;
    data['brand'] = brand;
    data['style'] = style;
    data['photos'] = photos;
    data['is_favorite'] = isFavorite;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
