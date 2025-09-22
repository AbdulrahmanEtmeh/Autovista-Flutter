enum VehicleSize {
  compact(title: 'compact'),
  midsize(title: 'midsize'),
  large(title: 'large');

  const VehicleSize({required this.title});
  final String title;
}
