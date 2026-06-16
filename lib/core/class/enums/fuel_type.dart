// ignore_for_file: constant_identifier_names

enum FuelType {
  premium_unleaded_required(
    title: 'premium_unleaded_required',
    titleAr: 'بنزين ممتاز إلزامي',
  ),
  regular_unleaded(
    title: 'regular_unleaded',
    titleAr: 'بنزين عادي',
  ),
  premium_unleaded_recommended(
    title: 'premium_unleaded_recommended',
    titleAr: 'بنزين ممتاز موصى به',
  ),
  flex_fuel_unleaded_E85(
    title: 'flex_fuel_unleaded_E85',
    titleAr: 'وقود مرن E85',
  ),
  diesel(
    title: 'diesel',
    titleAr: 'ديزل',
  );

  const FuelType({required this.title, required this.titleAr});
  final String title;
  final String titleAr;
}