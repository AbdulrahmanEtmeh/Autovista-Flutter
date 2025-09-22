// ignore_for_file: constant_identifier_names

enum DrivenWheels {
  rear_wheel_drive(title: 'rear_wheel_drive'),
  front_wheel_drive(title: 'front_wheel_drive'),
  all_wheel_drive(title: 'all_wheel_drive');

  const DrivenWheels({required this.title});
  final String title;
}
