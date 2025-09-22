// ignore_for_file: constant_identifier_names

enum MarketCategory {
  luxury(title: 'luxury'),
  factory_tuner_luxury_high_performance(
      title: 'factory_tuner_luxury_high_performance'),
  luxury_performance(title: 'luxury_performance'),
  luxury_high_performance(title: 'luxury_high_performance');

  const MarketCategory({required this.title});
  final String title;
}
