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

  factory CarBrandsModel.fromJson(Map<String, dynamic> json) {
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

    return CarBrandsModel(
      id: json['id'],
      name: json['name'],
      photos: parsePhotos(json),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photos'] = photos;
    return data;
  }
}
