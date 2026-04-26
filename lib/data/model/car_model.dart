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
    int? parseInt(dynamic value) {
      if (value == null) return null;
      return int.tryParse(value.toString()) ??
          double.tryParse(value.toString())?.toInt();
    }

    String? parseNestedName(dynamic value) {
      if (value is Map<String, dynamic>) {
        return value['name']?.toString();
      }
      return value?.toString();
    }

    List<String>? parsePhotos(Map<String, dynamic> source) {
      final raw = source['photos'] ?? source['images'];
      if (raw is! List) return null;

      return raw.map((e) {
        final url = e.toString();
        if (url.startsWith('http')) {
          final path = Uri.tryParse(url)?.path;
          if (path != null && path.isNotEmpty) {
            return path.startsWith('/') ? path.substring(1) : path;
          }
        }
        return url;
      }).toList();
    }

    int? parseFavorite(Map<String, dynamic> source) {
      if (source['is_favorite'] != null) {
        return parseInt(source['is_favorite']);
      }

      if (source['is_fav'] != null) {
        if (source['is_fav'] is bool) {
          return source['is_fav'] == true ? 1 : 0;
        }
        return parseInt(source['is_fav']);
      }

      return null;
    }

    return CarModel(
      id: parseInt(json['id']),
      name: json['name'],
      price: parseInt(json['price']),
      rating: json['rating'] != null
          ? double.tryParse(json['rating'].toString())
          : null,
      space: parseInt(json['space'] ?? json['cylinders']),
      capacity: parseInt(json['capacity']),
      gearType: json['gear_type'],
      consumption: parseInt(
        json['consumption'] ?? json['city_mpg'] ?? json['highway_mpg'],
      ),
      color: json['color'],
      date: json['date']?.toString() ?? json['year']?.toString(),
      brand: parseNestedName(json['brand']),
      style: parseNestedName(json['style']),
      photos: parsePhotos(json),
      isFavorite: parseFavorite(json),
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
