enum CarCylinders {
  three(cylinder: 3),
  four(cylinder: 4),
  six(cylinder: 6),
  eight(cylinder: 8),
  twelve(cylinder: 12);

  const CarCylinders({required this.cylinder});
  final int cylinder;
}
