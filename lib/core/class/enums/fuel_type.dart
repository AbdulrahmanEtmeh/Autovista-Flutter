// ignore_for_file: constant_identifier_names

enum FuelType {
  premium_unleaded_required(title: 'premium_unleaded_required'),
  regular_unleaded(title: 'regular_unleaded'),
  premium_unleaded_recommended(title: 'premium_unleaded_recommended'),
  flex_fuel_unleaded_E85(title: 'flex_fuel_unleaded_E85'),
  diesel(title: 'diesel');

  const FuelType({required this.title});
  final String title;
}
