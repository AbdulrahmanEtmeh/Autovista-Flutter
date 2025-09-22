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
    id = json['id'];
    name = json['name'];
    partCategoryId = json['part_category_id'];
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    price = json['price'];
    partNumber = json['part_number'];
    categoryName = json['category_name'];
    fitsCar = json['fits_car'];
    yearCar = json['year_car'];
    photos = json['photos'].cast<String>();
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
