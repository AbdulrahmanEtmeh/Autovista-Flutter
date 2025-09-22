// // ignore_for_file: non_constant_identifier_names

// import 'package:graduation_project/app_links.dart';

// import '../../../../core/class/crud.dart';

// class PricePredictionData {
//   Crud crud;
//   PricePredictionData(this.crud);
//   postData(
//     String make,
//     String model,
//     year,
//     String engine_fuel_type,
//     engine_hp,
//     engine_cylinders,
//     String transmission_type,
//     String driven_wheels,
//     double number_of_doors,
//     String market_category,
//     String vehicle_size,
//     String vehicle_style,
//     highway_mpg,
//     city_mpg,
//     String popularity,
//   ) async {
//     var response = await crud.postDataPr(AppLinks.pricePrediction, {
//       'make': make,
//       'model': model,
//       'year': year,
//       'engine_fuel_type': engine_fuel_type,
//       'engine_hp': engine_hp,
//       'engine_cylinders': engine_cylinders,
//       'transmission_type': transmission_type,
//       'driven_wheels': driven_wheels,
//       'number_of_doors': number_of_doors,
//       'market_category': market_category,
//       'vehicle_size': vehicle_size,
//       'vehicle_style': vehicle_style,
//       'highway_mpg': highway_mpg,
//       'city_mpg': city_mpg,
//       'popularity': popularity,
//     });
//     return response.fold((l) => l, (r) => r);
//   }
// }
