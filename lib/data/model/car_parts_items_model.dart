class CarPartsItemsModel {
  int? id;
  String? name;
  int? partCategoryId;
  int? brandId;
  String? brandName;
  String? price;
  String? partNumber;
  String? categoryName;
  String? fitsCar;
  int? yearCar;
  List<String>? photos;

  CarPartsItemsModel(
      {this.id,
      this.name,
      this.partCategoryId,
      this.brandId,
      this.brandName,
      this.price,
      this.partNumber,
      this.categoryName,
      this.fitsCar,
      this.yearCar,
      this.photos});

  CarPartsItemsModel.fromJson(Map<String, dynamic> json) {
    int? parseInt(dynamic value) {
      if (value == null) return null;
      return int.tryParse(value.toString());
    }

    String? parseString(dynamic value) {
      if (value == null) return null;
      final text = value.toString().trim();
      return text.isEmpty ? null : text;
    }

    id = parseInt(json['id']);
    name = parseString(json['name']);
    partCategoryId =
        parseInt((json['category'] as Map<String, dynamic>?)?['id']);
    brandId = parseInt((json['brand'] as Map<String, dynamic>?)?['id']);
    brandName = parseString((json['brand'] as Map<String, dynamic>?)?['name']);
    price = parseString(json['price']);
    partNumber = parseString(json['part_number']);
    categoryName =
        parseString((json['category'] as Map<String, dynamic>?)?['name']);
    fitsCar = parseString(json['fits_cars'] ?? json['fits_car']);
    yearCar = parseInt(json['car_year'] ?? json['year_car']);

    final images = json['images'] ?? json['photos'];
    if (images is List) {
      photos = images.map((e) => e.toString()).toList();
    } else {
      photos = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['part_category_id'] = partCategoryId;
    data['brand_id'] = brandId;
    data['brand_name'] = brandName;
    data['price'] = price;
    data['part_number'] = partNumber;
    data['category_name'] = categoryName;
    data['fits_car'] = fitsCar;
    data['year_car'] = yearCar;
    data['photos'] = photos;
    return data;
  }
}
