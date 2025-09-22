// ignore_for_file: constant_identifier_names

enum TransmissionType {
  manual(title: 'manual'),
  automatic(title: 'automatic'),
  automated_manual(title: 'automated_manual'),
  hybrid(title: 'Hybrid');

  const TransmissionType({required this.title});
  final String title;
}
