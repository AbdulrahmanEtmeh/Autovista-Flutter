import 'package:get/get.dart';

class CarModel {
  int? id;
  String? name;
  String? slug;
  double? price;
  double? rating;
  int? cylinders;
  int? capacity;
  String? gearType;
  int? topSpeed;
  String? fuelType;
  int? engineHp;
  int? highwayMpg;
  int? cityMpg;
  String? color;
  String? marketCategory;
  String? year;
  bool? isRent;
  int? brandId;
  String? brand;
  int? styleId;
  String? style;
  List<String>? photos;
  int? isFavorite;
  int? ownerId;
  String? ownerName;
  String? ownerEmail;
  String? ownerPhone;
  int? offerId;
  double? offerOldPrice;
  double? offerNewPrice;
  String? offerPercentage;
  String? createdAt;

  CarModel({
    this.id,
    this.name,
    this.slug,
    this.price,
    this.rating,
    this.cylinders,
    this.capacity,
    this.gearType,
    this.topSpeed,
    this.fuelType,
    this.engineHp,
    this.highwayMpg,
    this.cityMpg,
    this.color,
    this.marketCategory,
    this.year,
    this.isRent,
    this.brandId,
    this.brand,
    this.styleId,
    this.style,
    this.photos,
    this.isFavorite,
    this.ownerId,
    this.ownerName,
    this.ownerEmail,
    this.ownerPhone,
    this.offerId,
    this.offerOldPrice,
    this.offerNewPrice,
    this.offerPercentage,
    this.createdAt,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    //  Helpers 
    int? parseInt(dynamic value) {
      if (value == null) return null;
      return int.tryParse(value.toString()) ??
          double.tryParse(value.toString())?.toInt();
    }

    String? clean(dynamic raw) {
      final text = raw?.toString();
      if (text == null ||
          text.trim().isEmpty ||
          text.toLowerCase() == 'null') {
        return null;
      }
      return text;
    }
    
    String? parseLocalizedText(dynamic value) {
      final languageCode =
          (Get.locale?.languageCode ?? Get.deviceLocale?.languageCode ?? 'en')
              .toLowerCase();
      final preferArabic = languageCode.startsWith('ar');

      
      if (value is Map<String, dynamic>) {
        final en = clean(value['en']);
        final ar = clean(value['ar']);

        if (preferArabic) return ar ?? en;
        return en ?? ar;
      }

      return clean(value);
    }

    String? parseNestedName(dynamic value) {
      if (value is Map<String, dynamic>) {
        return parseLocalizedText(value['name']);
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
      if (source['is_favorite'] != null) return parseInt(source['is_favorite']);
      if (source['is_fav'] != null) {
        if (source['is_fav'] is bool) return source['is_fav'] == true ? 1 : 0;
        return parseInt(source['is_fav']);
      }
      return null;
    }

    //  Parse 

    final owner = json['owner'] is Map<String, dynamic>
        ? json['owner'] as Map<String, dynamic>
        : null;

    final offer = json['offer'] is Map<String, dynamic>
        ? json['offer'] as Map<String, dynamic>
        : null;

    final brandRaw = json['brand'] is Map<String, dynamic>
        ? json['brand'] as Map<String, dynamic>
        : null;

    final styleRaw = json['style'] is Map<String, dynamic>
        ? json['style'] as Map<String, dynamic>
        : null;

    return CarModel(
      id: parseInt(json['id']),
      name: parseLocalizedText(json['name']) ?? 'Unknown Car',
      slug: json['slug']?.toString(),
      price: json['price'] != null
          ? double.tryParse(json['price'].toString())
          : null,
      rating: json['rating'] != null
          ? double.tryParse(json['rating'].toString())
          : null,
      cylinders: parseInt(json['cylinders']),
      capacity: parseInt(json['capacity']),
      gearType: json['gear_type']?.toString(),
      topSpeed: parseInt(json['top_speed']),
      fuelType: json['fuel_type']?.toString(),
      engineHp: parseInt(json['engine_hp']),
      highwayMpg: parseInt(json['highway_mpg']),
      cityMpg: parseInt(json['city_mpg']),
      color: parseLocalizedText(json['color']),
      marketCategory: parseLocalizedText(json['market_category']),
      year: json['year']?.toString(),
      isRent: json['is_rent'] is bool
          ? json['is_rent'] as bool
          : json['is_rent'] != null
              ? json['is_rent'].toString() == 'true' ||
                  json['is_rent'].toString() == '1'
              : null,
      brandId: parseInt(brandRaw?['id']),
      brand: parseNestedName(json['brand']),
      styleId: parseInt(styleRaw?['id']),
      style: parseNestedName(json['style']),
      photos: parsePhotos(json),
      isFavorite: parseFavorite(json),
      ownerId: parseInt(owner?['id']),
      ownerName: owner?['name']?.toString(),
      ownerEmail: owner?['email']?.toString(),
      ownerPhone: owner?['phone']?.toString(),
      offerId: parseInt(offer?['id']),
      offerOldPrice: offer?['old_price'] != null
          ? double.tryParse(offer!['old_price'].toString())
          : null,
      offerNewPrice: offer?['new_price'] != null
          ? double.tryParse(offer!['new_price'].toString())
          : null,
      offerPercentage: offer?['percentage']?.toString(),
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'price': price,
      'rating': rating,
      'cylinders': cylinders,
      'capacity': capacity,
      'gear_type': gearType,
      'top_speed': topSpeed,
      'fuel_type': fuelType,
      'engine_hp': engineHp,
      'highway_mpg': highwayMpg,
      'city_mpg': cityMpg,
      'color': color,
      'market_category': marketCategory,
      'year': year,
      'is_rent': isRent,
      'brand_id': brandId,
      'brand': brand,
      'style_id': styleId,
      'style': style,
      'images': photos,
      'is_fav': isFavorite,
      'owner_id': ownerId,
      'owner_name': ownerName,
      'owner_email': ownerEmail,
      'owner_phone': ownerPhone,
      'offer_id': offerId,
      'offer_old_price': offerOldPrice,
      'offer_new_price': offerNewPrice,
      'offer_percentage': offerPercentage,
      'created_at': createdAt,
    };
  }
}