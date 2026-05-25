class CarPartsItemsModel {
  int? id;
  String? name;
  int? quantity;
  double? totalPartPrice;
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
      this.quantity,
      this.totalPartPrice,
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

    double? parseDouble(dynamic value) {
      if (value == null) return null;
      return double.tryParse(value.toString());
    }

    String? parseStringList(dynamic value) {
      if (value == null) return null;
      if (value is List) {
        final values = value
            .map((e) {
              if (e is Map<String, dynamic>) {
                return parseString(
                    e['name'] ?? e['model'] ?? e['car_model'] ?? e['value']);
              }
              return parseString(e);
            })
            .whereType<String>()
            .toList();
        if (values.isEmpty) return null;
        return values.join(', ');
      }
      return parseString(value);
    }

    Map<String, dynamic> asMap(dynamic value) {
      return value is Map<String, dynamic> ? value : <String, dynamic>{};
    }

    List<String> parseImages(dynamic value) {
      if (value is! List) return <String>[];
      return value.map((e) => e.toString()).toList();
    }

    final part = asMap(json['part']);
    final category = asMap(part['category']).isNotEmpty
        ? asMap(part['category'])
        : asMap(json['category']);
    final brand = asMap(part['brand']).isNotEmpty
        ? asMap(part['brand'])
        : asMap(json['brand']);

    id = parseInt(part['id'] ?? json['part_id'] ?? json['id']);
    name = parseString(part['name'] ?? json['name']);
    quantity = parseInt(json['quantity']);
    totalPartPrice = parseDouble(json['total_part_price']);
    partCategoryId = parseInt(category['id'] ?? part['part_category_id']);
    brandId = parseInt(brand['id'] ?? part['brand_id']);
    brandName = parseString(brand['name'] ?? part['brand_name']);
    price = parseString(json['price'] ?? part['price']);
    partNumber = parseString(json['part_number'] ?? part['part_number']);
    categoryName = parseString(
        json['category_name'] ?? category['name'] ?? part['category_name']);
    fitsCar = parseStringList(
      json['fits_cars'] ??
          json['fits_car'] ??
          part['fits_cars'] ??
          part['fits_car'] ??
          part['car'],
    );
    yearCar = parseInt(
      json['car_year'] ??
          json['year_car'] ??
          part['car_year'] ??
          part['year_car'] ??
          part['year'],
    );

    photos = parseImages(json['images'] ?? json['photos']);
    if (photos!.isEmpty) {
      photos = parseImages(part['images'] ?? part['photos']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['quantity'] = quantity;
    data['total_part_price'] = totalPartPrice;
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
