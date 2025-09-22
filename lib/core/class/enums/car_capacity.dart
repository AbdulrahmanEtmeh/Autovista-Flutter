enum CarCapacity {
  two(passengers: 2),
  four(passengers: 4),
  six(passengers: 6);

  const CarCapacity({required this.passengers});
  final int passengers;
}
